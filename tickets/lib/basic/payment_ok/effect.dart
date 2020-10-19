import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;

import 'action.dart';
import 'state.dart';

Effect<PaymentOKState> buildEffect() {
  return combineEffects(<Object, Effect<PaymentOKState>>{
    PaymentOKAction.back: _onBack,
  });
}

void _onBack(Action action, Context<PaymentOKState> ctx) {
  Navigator.of(ctx.context).popUntil((route) => route.isFirst);
}
