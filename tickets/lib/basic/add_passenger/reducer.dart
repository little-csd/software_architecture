import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AddPassengerState> buildReducer() {
  return asReducer(
    <Object, Reducer<AddPassengerState>>{
      AddPassengerAction.stateChange: _onStateChange,
    },
  );
}

AddPassengerState _onStateChange(AddPassengerState state, Action action) {
  final AddPassengerState newState = state.clone();
  newState.update(action.payload);
  return newState;
}
