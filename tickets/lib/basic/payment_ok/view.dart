import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:tickets/basic/payment_ok/action.dart';

import 'state.dart';

Widget buildView(
    PaymentOKState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text('支付成功'),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => dispatch(PaymentOKActionCreator.onBack()),
      ),
    ),
    body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Image.asset('assets/logo.png'),
          Container(
            height: 30,
          ),
          MaterialButton(
            color: Colors.blue,
            minWidth: double.infinity,
            onPressed: () => dispatch(PaymentOKActionCreator.onBack()),
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              '返回首页',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}
