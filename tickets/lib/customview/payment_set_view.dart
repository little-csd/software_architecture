import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentPwdWidget extends StatefulWidget {
  final String money;

  PaymentPwdWidget(this.money);

  @override
  State createState() => _PaymentPwdWidgetState(money);
}

class _PaymentPwdWidgetState extends State<PaymentPwdWidget> {
  String money;

  _PaymentPwdWidgetState(this.money);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('请输入支付密码'),
      contentPadding: EdgeInsets.all(10.0),
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Text(
            '¥$money',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextField(
          textAlign: TextAlign.center,
          maxLength: 6,
          decoration: InputDecoration(border: InputBorder.none),
          obscureText: true,
          style: TextStyle(fontSize: 30, letterSpacing: 30.0),
          onChanged: (str) {
            print(str);
            if (str.length == 6) {
              Navigator.of(context).pop(true);
            }
          },
        ),
      ],
    );
  }
}

/**
 * Container(
    alignment: Alignment.center,
    child: Container(
    width: _width,
    height: _height,
    color: Colors.white,
    child: Column(
    children: <Widget>[
    Expanded(
    flex: 1,
    child: Text(
    '请输入支付密码',
    style: const TextStyle(fontSize: 20, color: Colors.black),
    ),
    ),
    Expanded(
    flex: 1,
    child: Text(
    "¥100",
    style: const TextStyle(fontSize: 30, color: Colors.black),
    ),
    ),
    Expanded(
    flex: 1,
    child: TextField(),
    ),
    ],
    ),
    ))
 *
 * */
