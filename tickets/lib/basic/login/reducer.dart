import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginState>>{
      LoginAction.stateChange: _onStateChange,
    },
  );
}

LoginState _onStateChange(LoginState state, Action action) {
  var payload = action.payload;
  LoginState newState = state.clone()..update(payload);
  print('Login: state = ${newState.data}');
  return newState;
}
