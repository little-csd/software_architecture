import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:tickets/network/global.dart';
import 'package:tickets/network/request.dart';
import 'package:tickets/proto/train.pb.dart';

import 'action.dart';
import 'state.dart';

Effect<TrainPickerState> buildEffect() {
  return combineEffects(<Object, Effect<TrainPickerState>>{
    TrainPickerAction.click: _onClick,
    TrainPickerAction.back: _onBack,
  });
}

bool _sending = false;

void _onClick(Action action, Context<TrainPickerState> ctx) {
  if (_sending) {
    return;
  }
  _sending = true;
  int idx = action.payload;
  Ticket ticket = ctx.state.tickets[idx];
  // var priceRsp = createFakePriceRsp(id, ticket.tid);
  // Navigator.of(ctx.context).pushNamed('train_confirm', arguments: {
  //   'ticket': ticket,
  //   'price': double.parse(priceRsp.prices[0].substring(1)),
  // });
  // _sending = false;
  makePriceReq({'id': id, 'tid': ticket.tid}).then((value) {
    _sending = false;
    print('TrainPicker: get prices from server = ${value.prices}');
    int siz = value.prices.length;
    double price =
        siz == 0 ? 280 : double.parse(value.prices[siz - 1].substring(1));
    Navigator.of(ctx.context).pushNamed('train_confirm', arguments: {
      'ticket': ticket,
      'price': price,
    });
  }, onError: (e) {
    print(e);
    _sending = false;
  });
}

void _onBack(Action action, Context<TrainPickerState> ctx) {
  Navigator.of(ctx.context).pop();
}
