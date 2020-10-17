import 'package:fish_redux/fish_redux.dart';
import 'package:tickets/network/global.dart';

class MainState implements Cloneable<MainState> {
  int index = 0;
  Map<String, dynamic> searchData = Map()..['id'] = id;

  @override
  MainState clone() {
    return MainState()
      ..index = index
      ..searchData = searchData;
  }
}

MainState initState(Map<String, dynamic> args) {
  return MainState();
}
