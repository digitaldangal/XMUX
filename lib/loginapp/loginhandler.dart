import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/initapp/init.dart';
import 'package:xmux/redux/actions.dart';

class LoginHandler {
  static Future<String> loginAuth(
      String id, String password, BuildContext context) async {
    // Get response from backend.
    var response =
        await backendApiHandler(context: context, api: "/v2/login", body: {
      "id": id,
      "pass": password,
    });

    // When error
    if (response.statusCode >= 300) return response.reasonPhrase;

    Map responseMap = JSON.decode(response.body);
    if (responseMap.containsKey("error")) return responseMap["error"];

    // Init store with LoginMap.
    mainAppStore
        .dispatch(new InitAction.fromLogin(id,password,responseMap));

    return "success";
  }

  static Future<Map<String, dynamic>> ePaymentAuth(
      String id, String password) async {
    var response = await http.post(BackendApiConfig.address + "/bill", body: {
      "id": id,
      "pass": password,
    });
    if (response.statusCode >= 300) {
      return {"error": response.reasonPhrase};
    }
    Map resJson = JSON.decode(response.body);
    if (resJson.containsKey("error")) {
      String error = resJson["error"];
      return {"error": error};
    }

    globalPersonalInfoState.ePaymentPassword = password;
    globalCalendarState.paymentData = resJson;

    _save(
        JSON.encode({
          "campusId": mainAppStore.state.personalInfoState.uid,
          "password": mainAppStore.state.personalInfoState.password,
          "ePaymentPassword": globalPersonalInfoState.ePaymentPassword,
        }),
        "login.dat");
    return {"success": true};
  }

  static Future<Map<String, dynamic>> firebaseLogin() async {
    try {
      if (await FirebaseAuth.instance.currentUser() == null)
        firebaseUser = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: mainAppStore.state.personalInfoState.uid + "@xmu.edu.my",
            password: mainAppStore.state.personalInfoState.password);
      else
        firebaseUser = await FirebaseAuth.instance.currentUser();
    } catch (e) {
      return {"error": e.toString()};
    }

    return {"success": true};
  }

  static Future<Null> _save(String fileText, String fileName) async {
    String appDocDir = (await getApplicationDocumentsDirectory()).path;
    await (new File('$appDocDir/$fileName')).writeAsString(fileText);
  }
}
