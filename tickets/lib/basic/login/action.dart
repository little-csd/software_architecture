import 'package:fish_redux/fish_redux.dart';

enum LoginAction { submit, save, stateChange }

class LoginActionCreator {
  static Action onSubmit() {
    return const Action(LoginAction.submit);
  }

  static Action onSave() {
    return const Action(LoginAction.save);
  }

  static Action onStateChange(Map<String, dynamic> data) {
    return Action(LoginAction.stateChange, payload: data);
  }
}
