import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:tickets/main/action.dart';

import 'state.dart';

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: new AppBar(
      title: Text('Main Page'),
    ),
    body: Column(
      children: <Widget>[
        Text('Hello main page'),
        MaterialButton(
            color: Colors.yellow,
            onPressed: () {
              if (state.id != null) {
                print('you have login, id = ' + state.id);
                // return;
              }
              dispatch(MainActionCreator.onLogin());
            }),
      ],
    ),
  );
}
