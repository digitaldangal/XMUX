import 'package:firebase_auth/firebase_auth.dart';

class MainAppState {
  final bool drawerIsOpen;

  /// Personal info state include uid, password, etc.
  final PersonalInfoState personalInfoState;

  /// Settings state include ePaymentPassword, etc.
  final SettingState settingState;

  /// Homepage state include sliders and announcements.
  final HomePageState homePageState;

  /// AC state include timetable, exams, examResult and other academic data.
  final ACState acState;

  /// Init mainAppState as default.
  MainAppState()
      : this.drawerIsOpen = false,
        this.personalInfoState = new PersonalInfoState(),
        this.settingState = new SettingState(),
        this.homePageState = new HomePageState(),
        this.acState = new ACState();

  MainAppState.raw(this.drawerIsOpen, this.personalInfoState, this.settingState,
      this.homePageState, this.acState);

  MainAppState.fromJson(Map<String, Map> json, {FirebaseUser firebaseUser})
      : this.drawerIsOpen = false,
        this.personalInfoState =
            new PersonalInfoState.fromJson(json["personalInfoState"]),
        this.settingState =
            new SettingState.raw(json["settingState"]["ePaymentPassword"]),
        this.homePageState = new HomePageState(),
        this.acState = new ACState.fromJson(json["acState"]);

  Map<String, Map> toMap() => {
        "personalInfoState": this.personalInfoState.toMap(),
        "settingState": this.settingState.toMap(),
        "homePageState": {},
        "acState": this.acState.toMap(),
      };
}

class PersonalInfoState {
  /// User authentication (Campus ID).
  final String uid, password;

  /// Moodle key.
  final String moodleKey;

  PersonalInfoState()
      : this.uid = null,
        this.password = null,
        this.moodleKey = null;

  PersonalInfoState.fromJson(Map piJson)
      : this.uid = piJson["uid"],
        this.password = piJson["password"],
        this.moodleKey = piJson["moodleKey"];

  Map<String, String> toMap() => {
        "uid": this.uid,
        "password": this.password,
        "moodleKey": this.moodleKey,
      };
}

class SettingState {
  /// E-payment password.
  final String ePaymentPassword;

  SettingState() : ePaymentPassword = null;

  SettingState.raw(this.ePaymentPassword);

  Map<String, String> toMap() => {
        "ePaymentPassword": this.ePaymentPassword,
      };
}

class HomePageState {
  /// News for homepage slider.
  final List<Map<String, dynamic>> news;

  /// Announcements for homepage.
  final Map<String, dynamic> announcements;

  HomePageState()
      : this.news = const [],
        this.announcements = const {};
}

class ACState {
  /// AC status (success/error/init).
  final String status;

  /// Error message (available when error).
  String error;

  /// Last update timestamp.
  final int timestamp;

  /// Timetable list.
  final List<Map<String, dynamic>> timetable;

  /// Exams map.
  final List<Map<String, String>> exams;

  /// Exam result map.
  final List<Map<String, dynamic>> examResult;

  /// Assignment List.
  final List<Map> assignments;

  ACState()
      : this.status = "init",
        this.timestamp = null,
        this.timetable = null,
        this.exams = null,
        this.examResult = null,
        this.assignments = null;

  ACState.raw(this.status, this.error, this.timestamp, this.timetable,
      this.exams, this.examResult, this.assignments);

  ACState.fromJson(Map<String, dynamic> acJson)
      : this.status = acJson["status"],
        this.timestamp = acJson["timestamp"],
        this.timetable = acJson["data"]["timetable"],
        this.exams = acJson["data"]["exams"],
        this.examResult = acJson["data"]["examResult"],
        this.assignments = acJson["data"]["assignments"] ?? null,
        this.error = acJson["error"] ?? null;

  Map<String, dynamic> toMap() => {
        "status": this.status,
        "timestamp": this.timestamp,
        "data": {
          "timetable": this.timetable,
          "exams": this.exams,
          "examResult": this.examResult,
          "assignments": this.assignments,
        },
        "error": this.error ?? null,
      };

  ACState copyWith(
          {String status,
          String error,
          int timestamp,
          List<Map<String, dynamic>> timetable,
          List<Map<String, String>> exams,
          List<Map<String, dynamic>> examResult,
          List<Map> assignments}) =>
      new ACState.raw(
          status ?? this.status,
          error ?? this.error,
          timestamp ?? this.timestamp,
          timetable ?? this.timetable,
          exams ?? this.exams,
          examResult ?? this.examResult,
          assignments ?? this.assignments);
}
