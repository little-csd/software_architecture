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
final _controller = PageController();

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: PageView(
      controller: _controller,
      onPageChanged: (idx) {
        print('Main: page change to $idx');
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
        print('Main: tap index $idx');
        if (_controller.hasClients) {
          _controller.jumpToPage(idx);
        }
        dispatch(MainActionCreator.onPageChange(idx));
      },
      type: BottomNavigationBarType.fixed,
    ),
  );
}
