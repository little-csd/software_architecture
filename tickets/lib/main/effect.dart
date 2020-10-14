import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Effect<MainState> buildEffect() {
  return combineEffects(<Object, Effect<MainState>>{
    MainAction.login: _onLogin,
  });
}

void _onLogin(Action action, Context<MainState> ctx) async {
  var res = await Navigator.of(ctx.context).pushNamed('login');
  ctx.dispatch(MainActionCreator.onLoginReturn(res));
}
