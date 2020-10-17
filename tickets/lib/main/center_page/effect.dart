import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CenterState> buildEffect() {
  return combineEffects(<Object, Effect<CenterState>>{
    CenterAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CenterState> ctx) {
}
