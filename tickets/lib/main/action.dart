import 'package:fish_redux/fish_redux.dart';

enum MainAction { login, loginReturn }

class MainActionCreator {
  static Action onLogin() {
    return const Action(MainAction.login);
  }

  static Action onLoginReturn(dynamic data) {
    return Action(MainAction.loginReturn, payload: data);
  }
}
