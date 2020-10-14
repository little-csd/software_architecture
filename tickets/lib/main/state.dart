import 'package:fish_redux/fish_redux.dart';

class MainState implements Cloneable<MainState> {
  // id = null 表示还未登录
  String id;

  @override
  MainState clone() {
    return MainState()..id = id;
  }
}

MainState initState(Map<String, dynamic> args) {
  return MainState();
}
