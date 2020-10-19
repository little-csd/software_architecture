import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tickets/customview/payment_set_view.dart';

import 'action.dart';
import 'state.dart';

Effect<TrainConfirmState> buildEffect() {
  return combineEffects(<Object, Effect<TrainConfirmState>>{
    TrainConfirmAction.confirm: _onConfirm,
    TrainConfirmAction.clickAddBtn: _onClickAddBtn,
    TrainConfirmAction.back: _onBack,
  });
}

void _onConfirm(Action action, Context<TrainConfirmState> ctx) async {
  if (ctx.state.passengers.length == 0) {
    Fluttertoast.showToast(msg: '未选择乘客');
    return;
  }
  bool ok = await showCupertinoDialog(
      context: ctx.context,
      builder: (_) {
        return PaymentPwdWidget(
          (ctx.state.price * ctx.state.passengers.length).toString(),
        );
      });
  if (ok == null || ok == false) {
    Fluttertoast.showToast(msg: '支付失败');
  } else {
    Fluttertoast.showToast(msg: '支付成功');
    Navigator.of(ctx.context).pushNamed('payment_ok');
    // TODO: 添加到数据库
  }
}

// 传入已选择的乘车人的 id card
void _onClickAddBtn(Action action, Context<TrainConfirmState> ctx) async {
  final res = await Navigator.of(ctx.context).pushNamed('passenger_choose');
  if (res != null) {
    ctx.dispatch(TrainConfirmActionCreator.onUpdate(res));
  }
}

void _onBack(Action action, Context<TrainConfirmState> ctx) {
  Navigator.of(ctx.context).pop();
}
