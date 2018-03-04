class MainAppState {
  final bool drawerIsOpen;

  /// AC state include timetable, exams and examResult.
  ACState acState;

  MainAppState(this.drawerIsOpen);

  MainAppState.fromJson(Map json) : this.drawerIsOpen = false {
    acState = new ACState.fromJson(json);
  }

  get toString => "MainAppState";
}

class PersonalInfoState {
  String id, password, ePaymentPassword;
  String fullName, avatarURL;

  PersonalInfoState(
      {this.id,
      this.password,
      this.ePaymentPassword,
      this.fullName,
      this.avatarURL});

  void clear() {
    this.id = null;
    this.password = null;
    this.ePaymentPassword = null;
    this.fullName = null;
    this.avatarURL = null;
  }
}

class ACState {
  /// AC status (success/error).
  final String status;

  /// Error message (available when error).
  String error;

  /// Last update timestamp.
  final int timestamp;

  /// Timetable map.
  final Map<String, dynamic> timetable;

  /// Exams map.
  final Map<String, dynamic> exams;

  /// Exam result Map.
  final Map<String, dynamic> examResult;

  ACState(
      this.status, this.timestamp, this.timetable, this.exams, this.examResult,
      {this.error});

  ACState.fromJson(Map<String, dynamic> ACJson)
      : this.status = ACJson["status"],
        this.timestamp = ACJson["timestamp"],
        this.timetable = ACJson["data"]["timetable"],
        this.exams = ACJson["data"]["exams"],
        this.examResult = ACJson["data"]["examResult"],
        this.error = ACJson["error"] ?? null;
}
