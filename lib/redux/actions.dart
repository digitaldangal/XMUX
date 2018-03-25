abstract class MainAppAction {
  get name => "MainAppAction:";
}

class OpenDrawerAction extends MainAppAction {
  get name => super.name + "OpenDrawer";
  final bool drawerStatus;
  OpenDrawerAction(this.drawerStatus);
}

class InitAction extends MainAppAction {
  get name => super.name + "Init";
  final Map<String, dynamic> initMap;
  InitAction(this.initMap);
  InitAction.fromLogin(
      String id, String password, Map<String, dynamic> loginMap)
      : this.initMap = {
          "personalInfoState": {
            "uid": id,
            "password": password,
            "moodleKey": loginMap["moodleKey"],
          },
          "settingState": {"ePaymentPassword": null},
          "acState": {
            "status": "logined",
            "timestamp": loginMap["timestamp"],
            "data": {
              "timetable": null,
              "exams": null,
              "examResult": null,
              "assignments": null,
            },
          },
        };
}

class UpdateSettingAction extends MainAppAction {
  get name => super.name + "UpdateSetting";
}

class UpdateACAction extends MainAppAction {
  Map<String, dynamic> acInitMap;
  List assignments;
  UpdateACAction({this.acInitMap, this.assignments});
}
