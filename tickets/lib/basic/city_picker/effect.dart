import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/services.dart';

import 'action.dart';
import 'state.dart';

Effect<CityPickerState> buildEffect() {
  return combineEffects(<Object, Effect<CityPickerState>>{
    CityPickerAction.ok: _onOk,
    CityPickerAction.back: _onBack,
    Lifecycle.initState: _onInit,
  });
}

void _onOk(Action action, Context<CityPickerState> ctx) {
  String name = action.payload;
  print('city pick: $name');
  Navigator.of(ctx.context).pop(name);
}

void _onBack(Action action, Context<CityPickerState> ctx) {
  Navigator.of(ctx.context).pop();
}

void _onInit(Action action, Context<CityPickerState> ctx) async {
  String data = await rootBundle.loadString('assets/station.txt');
  Map<String, dynamic> station = jsonDecode(data);
  ctx.dispatch(CityPickerActionCreator.onInit(station));
}
