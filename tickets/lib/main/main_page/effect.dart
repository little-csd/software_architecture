import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tickets/network/request.dart';

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

bool _requesting = false;

void _onSubmit(Action action, Context<SearchState> ctx) {
  if (_requesting) {
    Fluttertoast.showToast(msg: '查询中, 请稍等');
    return;
  }

  var map = ctx.state.data;
  print('Main: send request for data: $map');
  String errno = _checkValid(map);
  if (errno.isEmpty) {
    Fluttertoast.showToast(msg: '查询中, 请稍等');
    _requesting = true;
    makeTrainReq(map).then((value) {
      print('Main: train request come back');
      var count = 0;
      value.tickets.forEach((element) {
        print('Main: count = $count, data = $element');
        count = count + 1;
      });
      _requesting = false;
      Navigator.of(ctx.context).pushNamed('train_picker', arguments: {
        'fs': map['fs'],
        'ts': map['ts'],
        'tickets': value.tickets
      });
    }, onError: (e) {
      print(e);
      _requesting = false;
    });
  } else {
    Fluttertoast.showToast(msg: errno);
  }
}

void _onCityPicker(Action action, Context<SearchState> ctx) async {
  final city = await Navigator.of(ctx.context).pushNamed('city_picker');
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

String _checkValid(Map<String, dynamic> map) {
  if (null == map['fs']) {
    return '出发地为空! 请重新填写';
  }
  if (null == map['ts']) {
    return '目的地为空! 请重新填写';
  }
  if (null == map['day']) {
    return '出发时间为空! 请重新填写';
  }
  return '';
}
