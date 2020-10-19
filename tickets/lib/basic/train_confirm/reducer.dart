import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TrainConfirmState> buildReducer() {
  return asReducer(
    <Object, Reducer<TrainConfirmState>>{
      TrainConfirmAction.updatePassenger: _onUpdate,
      TrainConfirmAction.removePassenger: _onRemove,
    },
  );
}

TrainConfirmState _onUpdate(TrainConfirmState state, Action action) {
  print('TrainConfirm: add passenger ${action.payload}');
  final TrainConfirmState newState = state.clone();
  newState.passengers = action.payload;
  return newState;
}

TrainConfirmState _onRemove(TrainConfirmState state, Action action) {
  print('TrainConfirm: remove at ${action.payload}');
  final TrainConfirmState newState = state.clone();
  newState.passengers.removeAt(action.payload);
  return newState;
}
