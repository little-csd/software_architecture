import 'package:fish_redux/fish_redux.dart';

import 'state.dart';

Reducer<TrainPickerState> buildReducer() {
  return asReducer(
    <Object, Reducer<TrainPickerState>>{},
  );
}

TrainPickerState _onAction(TrainPickerState state, Action action) {
  final TrainPickerState newState = state.clone();
  return newState;
}
