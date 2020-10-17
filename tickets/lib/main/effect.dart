import 'package:fish_redux/fish_redux.dart';

import 'state.dart';

Effect<MainState> buildEffect() {
  return combineEffects(<Object, Effect<MainState>>{
    Lifecycle.initState: _onLogin,
  });
}

void _onLogin(Action action, Context<MainState> ctx) async {}
