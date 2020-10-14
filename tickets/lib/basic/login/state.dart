import 'package:fish_redux/fish_redux.dart';

class LoginState implements Cloneable<LoginState> {
  Map<String, dynamic> data = new Map()
    ..['license'] = true
    ..['verify'] = '000000';

  @override
  LoginState clone() {
    return LoginState()..data = data;
  }

  bool checkValidForSubmit() {
    String id = data['id'];
    String verify = data['verify'];
    bool agreeLicense = data['license'];
    if (null == id || null == verify) return false;
    if (id.length != 11 || verify.length != 6 || !agreeLicense) return false;
    return true;
  }

  void update(Map newData) {
    data.addAll(newData);
  }
}

LoginState initState(Map<String, dynamic> args) {
  return LoginState();
}
