import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tickets/main/main_page/action.dart';

import '../../customview/ad_page_view.dart';
import 'state.dart';

var _imageList = [
  Image.asset(
    'assets/ad1.png',
  ),
  Image.asset(
    'assets/ad2.png',
  ),
  Image.asset(
    'assets/ad3.png',
  ),
  Image.asset(
    'assets/ad4.png',
  ),
];

const _centerIconPath = [
  'assets/order_meal.png',
  'assets/car_on_demand.png',
  'assets/insurance.png',
  'assets/loss_and_found.png'
];

const _centerIconText = ['订餐', '专车接送', '保险', '失物招领'];

Widget _createHeaderIcon(IconData data, VoidCallback callback) {
  return IconButton(
    onPressed: callback,
    icon: Icon(
      data,
      color: Colors.white,
    ),
  );
}

Widget _createAppBar() {
  return AppBar(
    title: Text(
      '首页',
      style: TextStyle(color: Colors.white),
    ),
    actions: <Widget>[
      _createHeaderIcon(Icons.search, () {
        print('Main: click search button');
      }),
      _createHeaderIcon(Icons.notifications, () {
        print('Main: click notification button');
      }),
    ],
  );
}

Widget _createFromToText(
    String src, String dst, VoidCallback srcCall, VoidCallback dstCall) {
  return Expanded(
    flex: 1,
    child: Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          width: 2,
          color: Colors.grey,
        )),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: srcCall,
              child: Text(
                src,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Icon(
                Icons.cached,
                size: 40,
                color: Colors.blue,
              )),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: dstCall,
              child: Text(
                dst,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget _createFromToPicker(
    SearchState state, Dispatch dispatch, ViewService viewService) {
  final fs = state.data['fs'];
  final ts = state.data['ts'];
  return Row(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(right: 20),
        child: Icon(
          Icons.location_on,
          size: 40,
          color: Colors.blue,
        ),
      ),
      _createFromToText(fs == null ? '出发地' : fs, ts == null ? '目的地' : ts, () {
        dispatch(SearchActionCreator.onOpenStation('fs'));
      }, () {
        dispatch(SearchActionCreator.onOpenStation('ts'));
      }),
    ],
  );
}

Widget _createExpandedTextWithStyle(String text, VoidCallback callback) {
  return Expanded(
    flex: 1,
    child: Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          width: 2,
          color: Colors.grey,
        )),
      ),
      child: GestureDetector(
        onTap: callback,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    ),
  );
}

Widget _createTimePicker(
    SearchState state, Dispatch dispatch, ViewService viewService) {
  final day = state.data['day'];
  return Padding(
    padding: EdgeInsets.only(top: 10, bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.calendar_today,
            size: 40,
            color: Colors.blue,
          ),
        ),
        _createExpandedTextWithStyle(day == null ? '选择时间' : day, () {
          dispatch(SearchActionCreator.onOpenDatePicker());
        }),
      ],
    ),
  );
}

Widget _createExpandedRadio(
    String title, bool state, ValueChanged<bool> onClick) {
  return Expanded(
    flex: 1,
    child: Row(
      children: <Widget>[
        Checkbox(
          value: state,
          onChanged: onClick,
        ),
        Text(title),
      ],
    ),
  );
}

Widget _createChooseWidget(
    SearchState state, Dispatch dispatch, ViewService viewService) {
  return Row(
    children: <Widget>[
      _createExpandedRadio('仅动车', state.data['b_bullet'], (value) {
        print('Main: click bullet $value');
        dispatch(SearchActionCreator.onStateChange({'b_bullet': value}));
      }),
      _createExpandedRadio('学生票', state.data['b_student'], (value) {
        print('Main: click student $value');
        dispatch(SearchActionCreator.onStateChange({'b_student': value}));
      }),
    ],
  );
}

Widget _createSearchClickBtn(
    SearchState state, Dispatch dispatch, ViewService viewService) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(right: 15),
        child: Icon(
          Icons.search,
          color: Colors.blue,
          size: 30,
        ),
      ),
      MaterialButton(
        minWidth: 250,
        color: Colors.blue,
        child: Text(
          '车票查询',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => dispatch(SearchActionCreator.onSubmit()),
      ),
    ],
  );
}

Widget _createSearchWidget(
    SearchState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    width: double.infinity,
    height: 380,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/search_back.png'),
        fit: BoxFit.fill,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.only(bottom: 20, left: 50, right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _createFromToPicker(state, dispatch, viewService),
          _createTimePicker(state, dispatch, viewService),
          _createChooseWidget(state, dispatch, viewService),
          _createSearchClickBtn(state, dispatch, viewService),
        ],
      ),
    ),
  );
}

Widget _createExpandedImage(String uri) {
  return Expanded(
    flex: 1,
    child: IconButton(
      padding: EdgeInsets.zero,
      icon: Image.asset(uri),
      onPressed: () => print('Main: click $uri'),
    ),
  );
}

Widget _createCenterIcons() {
  return Row(
    children: <Widget>[
      _createExpandedImage(_centerIconPath[0]),
      _createExpandedImage(_centerIconPath[1]),
      _createExpandedImage(_centerIconPath[2]),
      _createExpandedImage(_centerIconPath[3]),
    ],
  );
}

Widget _createExpandedText(String text) {
  return Expanded(
    flex: 1,
    child: Text(
      text,
      textAlign: TextAlign.center,
    ),
  );
}

Widget _createCenterIconText() {
  return Row(
    children: <Widget>[
      _createExpandedText(_centerIconText[0]),
      _createExpandedText(_centerIconText[1]),
      _createExpandedText(_centerIconText[2]),
      _createExpandedText(_centerIconText[3])
    ],
  );
}

Widget buildView(
    SearchState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: _createAppBar(),
    body: Column(
      children: <Widget>[
        _createSearchWidget(state, dispatch, viewService),
        _createCenterIcons(),
        _createCenterIconText(),
        Padding(
          padding: EdgeInsets.only(top: 20, left: 10, right: 10),
          child: AdPageView(_imageList),
        ),
      ],
    ),
  );
}
