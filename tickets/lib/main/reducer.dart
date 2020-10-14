import 'package:fish_redux/fish_redux.dart';
import 'package:tickets/main/action.dart';

import 'state.dart';

Reducer<MainState> buildReducer() {
  return asReducer(
    <Object, Reducer<MainState>>{MainAction.loginReturn: _onLoginReturn},
  );
}

MainState _onLoginReturn(MainState state, Action action) {
  var data = action.payload as String;
  print(data);
  if (data == null || data.isEmpty) {
    return state;
  }
  return state.clone()..id = data;
}
