import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'action.dart';
import 'state.dart';

const _textBorder =
    BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid);

Decoration _createBoxDecoration() {
  return BoxDecoration(
    border: Border(
      bottom: _textBorder,
      left: _textBorder,
      right: _textBorder,
    ),
  );
}

Widget _createIconWithPadding(IconData data) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Icon(
      data,
      color: Colors.grey,
    ),
  );
}

Widget _createExpandedTextFieldWithNoBorder(ValueChanged<String> onChange) {
  return Expanded(
    flex: 1,
    child: TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      style: const TextStyle(fontSize: 18),
      onChanged: onChange,
    ),
  );
}

Widget _createSendCodeButton(VoidCallback callback) {
  return Padding(
    padding: EdgeInsets.only(left: 5, right: 10),
    child: OutlineButton(
      borderSide: BorderSide(color: Colors.blue),
      hoverColor: Colors.blue,
      textColor: Colors.blue,
      child: Text('发送验证码'),
      onPressed: callback,
    ),
  );
}

Widget _buildTopIcon() {
  return Padding(
    child: Image.asset(
      'assets/logo.png',
      width: 130,
      height: 130,
    ),
    padding: EdgeInsets.only(top: 20, bottom: 15),
  );
}

Widget _buildInputView(
    LoginState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    padding: EdgeInsets.only(left: 30, right: 30),
    child: Column(
      children: <Widget>[
        DecoratedBox(
            decoration: new BoxDecoration(
              border: Border.fromBorderSide(_textBorder),
            ),
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Row(
                children: <Widget>[
                  _createIconWithPadding(Icons.phone_android),
                  _createExpandedTextFieldWithNoBorder((str) =>
                      dispatch(LoginActionCreator.onStateChange({'id': str})))
                ],
              ),
            )),
        DecoratedBox(
          decoration: _createBoxDecoration(),
          child: Row(
            children: <Widget>[
              _createIconWithPadding(Icons.email),
              _createExpandedTextFieldWithNoBorder((str) =>
                  dispatch(LoginActionCreator.onStateChange({'verify': str}))),
              _createSendCodeButton(() {
                Fluttertoast.showToast(msg: '000000');
              })
            ],
          ),
        )
      ],
    ),
  );
}

Widget _buildAgreeLicense(
    LoginState state, Dispatch dispatch, ViewService viewService) {
  return Padding(
    padding: EdgeInsets.only(left: 30, top: 5, bottom: 5),
    child: Row(
      children: <Widget>[
        Checkbox(
          value: state.data['license'],
          onChanged: (value) =>
              dispatch(LoginActionCreator.onStateChange({'license': value})),
        ),
        Text('同意《用户服务协议》'),
      ],
    ),
  );
}

Widget _buildLoginButton(
    LoginState state, Dispatch dispatch, ViewService viewService) {
  return MaterialButton(
    minWidth: 200,
    height: 40,
    color: Colors.blue,
    textColor: Colors.white,
    child: Text('登录'),
    onPressed: () {
      print('click button');
      dispatch(LoginActionCreator.onSubmit());
    },
  );
}

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: new AppBar(
      title: Text('login'),
    ),
    body: Column(
      children: <Widget>[
        _buildTopIcon(),
        _buildInputView(state, dispatch, viewService),
        _buildAgreeLicense(state, dispatch, viewService),
        _buildLoginButton(state, dispatch, viewService)
      ],
    ),
  );
}
