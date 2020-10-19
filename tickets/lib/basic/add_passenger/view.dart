import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:tickets/basic/add_passenger/action.dart';

import 'state.dart';

const _horizontalPadding = 20.0;
const _topPadding = 20.0;
const _textHeight = 10.0;
const _fontSize = 16.0;
const _bgColor = Color.fromARGB(0xff, 0xe0, 0xe0, 0xe0);
const _borderColor = Color.fromARGB(0x7f, 0xa0, 0xa0, 0xa0);

Widget _buildAppBar(
    AddPassengerState state, Dispatch dispatch, ViewService viewService) {
  return AppBar(
    title: Text('新增乘车人信息'),
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => dispatch(AddPassengerActionCreator.onBack()),
    ),
  );
}

Widget _createInputField(
    String text, String hint, ValueChanged<String> callback) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.white, border: Border.all(width: 1, color: _borderColor)),
    // margin: EdgeInsets.only(top: 5),
    // padding: EdgeInsets.only(top: _textHeight, bottom: _textHeight),
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(
            text,
            style: TextStyle(fontSize: _fontSize),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 3,
          child: TextField(
            decoration:
                InputDecoration(hintText: hint, border: InputBorder.none),
            maxLines: 1,
            enableInteractiveSelection: false,
            onChanged: callback,
          ),
        ),
      ],
    ),
  );
}

Widget _buildInputFields(
    AddPassengerState state, Dispatch dispatch, ViewService viewService) {
  return Column(
    children: <Widget>[
      _createInputField(
          '真实姓名',
          '输入真实姓名',
          (str) =>
              dispatch(AddPassengerActionCreator.onStateChange({'name': str}))),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: _borderColor)),
        // margin: EdgeInsets.only(top: 5),
        // padding: EdgeInsets.only(top: _textHeight, bottom: _textHeight),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text(
                '证件类型',
                style: TextStyle(fontSize: _fontSize),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 3,
              child: MaterialButton(
                child: Text(
                  '身份证',
                  style: TextStyle(color: Colors.grey, fontSize: _fontSize),
                  textAlign: TextAlign.start,
                ),
                onPressed: () =>
                    dispatch(AddPassengerActionCreator.onChooseType()),
              ),
            ),
          ],
        ),
      ),
      _createInputField(
          '证件号码',
          '输入证件号码',
          (str) => dispatch(
              AddPassengerActionCreator.onStateChange({'idCard': str}))),
      _createInputField(
          '手机号码', '输入手机号码', (str) => print('AddPassenger: input phone number')),
    ],
  );
}

Widget _createConfirmBtn(
    AddPassengerState state, Dispatch dispatch, ViewService viewService) {
  return Padding(
    padding: EdgeInsets.only(top: 30),
    child: MaterialButton(
      color: Colors.blue,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(vertical: _textHeight),
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: () => dispatch(AddPassengerActionCreator.onConfirm()),
      child: Text(
        '确认',
        style: TextStyle(
          color: Colors.white,
          fontSize: _fontSize,
        ),
      ),
    ),
  );
}

Widget buildView(
    AddPassengerState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: _buildAppBar(state, dispatch, viewService),
    body: Container(
      color: _bgColor,
      width: double.infinity,
      padding: EdgeInsets.only(
        top: _topPadding,
        left: _horizontalPadding,
        right: _horizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: _textHeight),
            child: Text(
              '基本资料',
              style: TextStyle(fontSize: _fontSize),
            ),
          ),
          _buildInputFields(state, dispatch, viewService),
          _createConfirmBtn(state, dispatch, viewService)
        ],
      ),
    ),
  );
}
