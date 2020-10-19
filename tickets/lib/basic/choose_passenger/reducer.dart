import 'package:fish_redux/fish_redux.dart';
import 'package:tickets/basic/choose_passenger/action.dart';

import 'state.dart';

Reducer<ChoosePassengerState> buildReducer() {
  return asReducer(
    <Object, Reducer<ChoosePassengerState>>{
      ChoosePassengerAction.choose: _onChoose,
      ChoosePassengerAction.add: _onAdd,
    },
  );
}

ChoosePassengerState _onChoose(ChoosePassengerState state, Action action) {
  final ChoosePassengerState newState = state.clone();
  newState.clickItem(action.payload);
  return newState;
}

ChoosePassengerState _onAdd(ChoosePassengerState state, Action action) {
  final ChoosePassengerState newState = state.clone();
  newState.addPassengers(action.payload);
  return newState;
}
