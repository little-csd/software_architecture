import 'package:fish_redux/fish_redux.dart';
import 'package:tickets/main/action.dart';

import 'state.dart';

Reducer<MainState> buildReducer() {
  return asReducer(
    <Object, Reducer<MainState>>{MainAction.pageChange: _onPageChange},
  );
}

MainState _onPageChange(MainState state, Action action) {
  return state.clone()..index = action.payload;
}
