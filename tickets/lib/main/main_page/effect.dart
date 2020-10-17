import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Effect<SearchState> buildEffect() {
  return combineEffects(<Object, Effect<SearchState>>{
    SearchAction.search: _onSubmit,
    SearchAction.datePicker: _onOpenDatePicker,
    SearchAction.chooseStation: _onCityPicker,
    SearchAction.submit: _onSubmit,
  });
}

void _onSubmit(Action action, Context<SearchState> ctx) {
  var map = ctx.state.data;
  print('send request for data: $map');
  // makeTrainReq(map).then((value) {
  //   print('train request come back');
  //   var count = 0;
  //   value.tickets.forEach((element) {
  //     print('count = $count, data = $element');
  //   });
  // });
}

void _onCityPicker(Action action, Context<SearchState> ctx) async {
  final city = await Navigator.of(ctx.context).pushNamed('city_picker');
  print(city);
  if (null == city) {
    return;
  }
  ctx.dispatch(SearchActionCreator.onStateChange({action.payload: city}));
}

void _onOpenDatePicker(Action action, Context<SearchState> ctx) async {
  final firstDay = DateTime.now();
  showDatePicker(
          context: ctx.context,
          initialDate: firstDay,
          firstDate: firstDay,
          lastDate: firstDay.add(Duration(days: 30)))
      .then((value) {
    if (null == value) return;
    ctx.dispatch(
        SearchActionCreator.onStateChange({'day': _getDayFromDateTime(value)}));
  });
}

String _getDayFromDateTime(DateTime date) {
  return date.toString().substring(0, 10);
}
