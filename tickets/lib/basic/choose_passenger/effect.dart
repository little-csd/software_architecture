import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:tickets/data/database.dart';
import 'package:tickets/proto/passenger.pb.dart';

import 'action.dart';
import 'state.dart';

Effect<ChoosePassengerState> buildEffect() {
  return combineEffects(<Object, Effect<ChoosePassengerState>>{
    ChoosePassengerAction.confirm: _onConfirm,
    ChoosePassengerAction.addMore: _onAddMore,
    ChoosePassengerAction.back: _onBack,
    Lifecycle.initState: _onInit,
  });
}

void _onBack(Action action, Context<ChoosePassengerState> ctx) {
  Navigator.of(ctx.context).pop();
}

void _onConfirm(Action action, Context<ChoosePassengerState> ctx) {
  Navigator.of(ctx.context).pop(ctx.state.getAllChosenPassengers());
}

void _onAddMore(Action action, Context<ChoosePassengerState> ctx) async {
  final passenger = await Navigator.of(ctx.context).pushNamed('passenger_add');
  if (passenger == null) return;
  ctx.dispatch(ChoosePassengerActionCreator.onAdd([passenger]));
}

void _onInit(Action action, Context<ChoosePassengerState> ctx) async {
  List<Passenger> passengers = await db.getPassengers();
  if (passengers != null && passengers.length > 0) {
    ctx.dispatch(ChoosePassengerActionCreator.onAdd(passengers));
  }
}
