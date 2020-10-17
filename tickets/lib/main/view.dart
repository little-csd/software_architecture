import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:tickets/main/action.dart';

import 'state.dart';

BottomNavigationBarItem _createBottomNavigationBarItem(
    IconData data, String title) {
  return BottomNavigationBarItem(
    icon: Icon(data),
    title: Text(title),
  );
}

const _pageName = ['main', 'message', 'order', 'center'];

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: PageView(
      controller: PageController(),
      onPageChanged: (idx) {
        print('page change to $idx');
        dispatch(MainActionCreator.onPageChange(idx));
      },
      children: <Widget>[
        viewService.buildComponent(_pageName[0]),
        viewService.buildComponent(_pageName[1]),
        viewService.buildComponent(_pageName[2]),
        viewService.buildComponent(_pageName[3]),
      ],
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: [
        _createBottomNavigationBarItem(Icons.home, '首页'),
        _createBottomNavigationBarItem(Icons.message, '消息'),
        _createBottomNavigationBarItem(Icons.check_circle, '订单'),
        _createBottomNavigationBarItem(Icons.person, '中心'),
      ],
      currentIndex: state.index,
      onTap: (idx) {
        print('tap index $idx');
        dispatch(MainActionCreator.onPageChange(idx));
      },
      type: BottomNavigationBarType.fixed,
    ),
  );
}

/**
 * Column(
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
    )
 */
