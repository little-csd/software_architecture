import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchState> buildReducer() {
  return asReducer(
    <Object, Reducer<SearchState>>{SearchAction.stateChange: _onStateChange},
  );
}

SearchState _onStateChange(SearchState state, Action action) {
  SearchState newState = state.clone();
  newState.update(action.payload);
  print('after update message = ${newState.data}');
  return newState;
}
