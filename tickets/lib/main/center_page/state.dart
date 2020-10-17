import 'package:fish_redux/fish_redux.dart';

class CenterState implements Cloneable<CenterState> {

  @override
  CenterState clone() {
    return CenterState();
  }
}

CenterState initState(Map<String, dynamic> args) {
  return CenterState();
}
