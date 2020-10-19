import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:tickets/basic/choose_passenger/action.dart';
import 'package:tickets/proto/passenger.pb.dart';

import 'state.dart';

const _edgeOffset = 25.0;
const _textInBtnOffset = 10.0;
const _fontSize = 18.0;

Widget _createAppBar(
    ChoosePassengerState state, Dispatch dispatch, ViewService viewService) {
  return AppBar(
    title: Text('选择乘客'),
    centerTitle: true,
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => dispatch(ChoosePassengerActionCreator.onBack()),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.person_add),
        onPressed: () => dispatch(ChoosePassengerActionCreator.onAddMore()),
      ),
    ],
  );
}

Widget _createSinglePassenger(ChoosePassengerState state, Dispatch dispatch,
    ViewService viewService, int idx, Passenger passenger) {
  bool isChosen = state.isChosen(idx);
  return Row(
    children: <Widget>[
      Checkbox(
        value: isChosen,
        onChanged: (value) =>
            dispatch(ChoosePassengerActionCreator.onChoose(idx)),
      ),
      Container(
        padding: EdgeInsets.only(top: 15, bottom: 10),
        // decoration: BoxDecoration(
        //     border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              passenger.name,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              '身份证 ${passenger.idCard.replaceRange(4, 15, '***********')}',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _createConfirmBtn(
    ChoosePassengerState state, Dispatch dispatch, ViewService viewService) {
  return Padding(
    padding: EdgeInsets.only(top: 50),
    child: FlatButton(
      padding: EdgeInsets.only(top: _textInBtnOffset, bottom: _textInBtnOffset),
      onPressed: () => dispatch(ChoosePassengerActionCreator.onConfirm()),
      color: Colors.blue,
      child: Text(
        '确认选择',
        style: TextStyle(fontSize: _fontSize, color: Colors.white),
      ),
    ),
  );
}

Widget buildView(
    ChoosePassengerState state, Dispatch dispatch, ViewService viewService) {
  List<Widget> list = List();
  List<Passenger> passengers = state.getAllPassengers();
  // print('here, length = ${passengers.length}');
  for (int i = 0; i < passengers.length; i++) {
    // print('current in $i');
    list.add(
        _createSinglePassenger(state, dispatch, viewService, i, passengers[i]));
  }
  list.add(_createConfirmBtn(state, dispatch, viewService));
  // print(list.length);
  return Scaffold(
    appBar: _createAppBar(state, dispatch, viewService),
    body: ListView(
      padding: EdgeInsets.all(_edgeOffset),
      children: list,
    ),
  );
}
