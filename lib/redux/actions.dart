abstract class MainAppAction {
  String toString() => "";
}

class OpenDrawerAction extends MainAppAction {
  final bool drawerStatus;
  OpenDrawerAction(this.drawerStatus);
}
