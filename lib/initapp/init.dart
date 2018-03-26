import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/loginapp/loginhandler.dart';
import 'package:xmux/mainapp/calendar/calendarhandler.dart';
import 'package:xmux/redux/actions.dart';

final GPersonalInfoState globalPersonalInfoState = new GPersonalInfoState();
final CalendarState globalCalendarState = new CalendarState();

Future<String> init() async {
  String appDocDir;
  Map<String, Map> initMap;

  // Check if local state is available.
  try {
    appDocDir = (await getApplicationDocumentsDirectory()).path;
    initMap =
        JSON.decode(await (new File('$appDocDir/state.dat')).readAsString());

    // Init store from initMap
    mainAppStore.dispatch(new InitAction(initMap));
  } catch (e) {
    FirebaseAuth.instance.signOut();
    return "NotLogin";
  }

  CalendarHandler.acUpdate();
  CalendarHandler.assignmentUpdate();

  var response = await http.post(BackendApiConfig.address + "/refresh", body: {
    "id": mainAppStore.state.personalInfoState.uid,
    "cpass": mainAppStore.state.personalInfoState.password,
    "epass": mainAppStore.state.settingState.ePaymentPassword ?? ""
  });
  Map resJson = JSON.decode(response.body);

  if (resJson.containsKey("error") ||
      (await LoginHandler.firebaseLogin()).containsKey("error")) {
    FirebaseAuth.instance.signOut();
    return "LoginError";
  }

  globalPersonalInfoState.ePaymentPassword =
      mainAppStore.state.settingState.ePaymentPassword;
  globalCalendarState.classesData = resJson["timetable"];
  globalCalendarState.examsData = resJson["exam"];
  globalCalendarState.assignmentData = resJson["assignment"];
  globalCalendarState.paymentData = resJson["bill"];

  return "Finished";
}

class GPersonalInfoState {
  String ePaymentPassword;

  GPersonalInfoState({
    this.ePaymentPassword,
  });

  void clear() {
    this.ePaymentPassword = null;
  }
}

class CalendarState {
  Map classesData, examsData, paymentData;
  List assignmentData;

  CalendarState(
      {this.classesData,
      this.examsData,
      this.paymentData,
      this.assignmentData});

  void clear() {
    this.classesData = null;
    this.examsData = null;
    this.paymentData = null;
    this.assignmentData = null;
  }
}
