import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CenterState> buildReducer() {
  return asReducer(
    <Object, Reducer<CenterState>>{
      CenterAction.action: _onAction,
    },
  );
}

CenterState _onAction(CenterState state, Action action) {
  final CenterState newState = state.clone();
  return newState;
}
