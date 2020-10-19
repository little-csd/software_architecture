import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tickets/data/database.dart';
import 'package:tickets/proto/passenger.pb.dart';

import 'action.dart';
import 'state.dart';

Effect<AddPassengerState> buildEffect() {
  return combineEffects(<Object, Effect<AddPassengerState>>{
    AddPassengerAction.back: _onBack,
    AddPassengerAction.confirm: _onConfirm,
    AddPassengerAction.chooseType: _onChooseType,
  });
}

void _onBack(Action action, Context<AddPassengerState> ctx) {
  Navigator.of(ctx.context).pop();
}

void _onConfirm(Action action, Context<AddPassengerState> ctx) {
  Passenger passenger = ctx.state.buildPassenger();
  if (passenger == null) {
    Fluttertoast.showToast(msg: 'input format error');
    return;
  }
  db.addPassenger(passenger);
  Navigator.of(ctx.context).pop(passenger);
}

void _onChooseType(Action action, Context<AddPassengerState> ctx) {
  // showModalBottomSheet(
  //     context: ctx.context,
  //     builder: (ctx) {
  //       return _buildBottomSheet();
  //     });
}

// TODO: fix it
const _types = [
  '护照',
  '台胞证',
  '回乡证',
  '军人证',
  '港澳通行证',
  '户口簿',
  '出生证明',
  '外国人永久居留身份证',
  '台湾通行证',
  '士兵证',
  '临时身份证',
  '警官证',
  '国际海员证',
  '旅行证',
  '学生证',
  '驾驶证',
  '其他',
];

Widget _buildBottomSheet() {
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: () => print('AddPassenger: 取消'),
              child: Text(
                '取消',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '证件类型',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: () => print('AddPassenger: 确定'),
              child: Text(
                '确定',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ),
        ],
      ),
      Container(
        height: 1,
        color: Color.fromARGB(0xff, 0xe0, 0xe0, 0xe0),
      ),
      ListView.builder(
        itemBuilder: (ctx, idx) {
          return FlatButton(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            onPressed: () => print('AddPassenger: you click $idx'),
            child: Text(_types[idx]),
          );
        },
        itemCount: _types.length,
        shrinkWrap: true,
      ),
    ],
  );
}
