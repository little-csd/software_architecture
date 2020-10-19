import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tickets/basic/train_confirm/action.dart';
import 'package:tickets/proto/passenger.pb.dart';
import 'package:tickets/proto/train.pb.dart';

import 'state.dart';

const _bgColor = Color.fromARGB(0xff, 0xe0, 0xe0, 0xe0);
const _itemOffset = 15.0;
const _edgeOffset = 25.0;
const _textHeightOffset = 12.0;
const _trainImgSize = 70.0;

Widget _createStationPart(String time, String name) {
  return Expanded(
    flex: 1,
    child: Container(
      padding: EdgeInsets.all(10),
      child: Text(
        '$time\n$name',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 22,
        ),
      ),
    ),
  );
}

Widget _createTrainPart(String name) {
  return Column(
    children: <Widget>[
      Image.asset(
        'assets/train.png',
        width: _trainImgSize,
        height: _trainImgSize,
      ),
      Text(name),
    ],
  );
}

Widget _createExpandedText(String title) {
  return Expanded(
    flex: 1,
    child: Padding(
      padding: const EdgeInsets.only(
          top: _textHeightOffset, bottom: _textHeightOffset),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    ),
  );
}

Widget _createTicketWidget(
    TrainConfirmState state, Dispatch dispatch, ViewService viewService) {
  Ticket ticket = state.ticket;
  return Container(
    color: Colors.white,
    padding: EdgeInsets.only(left: _edgeOffset, right: _edgeOffset),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            _createStationPart(ticket.fTime, ticket.fStation),
            _createTrainPart(ticket.kid),
            _createStationPart(ticket.tTime, ticket.tStation),
          ],
        ),
        Divider(
          color: Colors.grey,
        ),
        Row(
          children: <Widget>[
            _createExpandedText('票价: ¥${state.price}'),
            _createExpandedText('日期: ${state.ticket.fTime}'),
          ],
        )
      ],
    ),
  );
}

Widget _createSinglePassenger(Passenger passenger, Dispatch dispatch, int idx) {
  return Padding(
    padding: EdgeInsets.only(top: _itemOffset),
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.only(
          left: _edgeOffset,
          right: _edgeOffset,
          top: _textHeightOffset,
          bottom: _textHeightOffset),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () => dispatch(TrainConfirmActionCreator.onRemove(idx)),
            icon: Icon(
              Icons.do_not_disturb_on,
              size: 30,
              color: Colors.blue,
            ),
          ),
          Column(
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
          )
        ],
      ),
    ),
  );
}

Widget _createPassengersWidget(
    TrainConfirmState state, Dispatch dispatch, ViewService viewService) {
  List<Passenger> passengers = state.passengers;
  print('TrainConfirm: length when create widget ${passengers.length}');
  List<Widget> passengerWidgets = [];
  for (int i = 0; i < passengers.length; i++) {
    passengerWidgets.add(_createSinglePassenger(passengers[i], dispatch, i));
  }
  return Column(
    children: passengerWidgets,
  );
}

Widget _createAddPassengerBtn(
    TrainConfirmState state, Dispatch dispatch, ViewService viewService) {
  return Padding(
    padding: EdgeInsets.only(top: _itemOffset * 2, bottom: _itemOffset),
    child: FlatButton(
      color: Colors.white,
      padding:
          EdgeInsets.only(top: _textHeightOffset, bottom: _textHeightOffset),
      onPressed: () => dispatch(TrainConfirmActionCreator.onClickAddBtn()),
      child: RichText(
        text: TextSpan(
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
            children: [
              WidgetSpan(
                child: Icon(
                  Icons.add,
                  color: Colors.blue,
                ),
              ),
              TextSpan(
                text: '选择乘车人 (成人/儿童/学生)',
              ),
            ]),
      ),
    ),
  );
}

Widget _createConfirmBtn(
    TrainConfirmState state, Dispatch dispatch, ViewService viewService) {
  return Padding(
    padding: EdgeInsets.only(
        top: _itemOffset, left: _edgeOffset, right: _edgeOffset),
    child: FlatButton(
      onPressed: () => dispatch(TrainConfirmActionCreator.onConfirm()),
      color: Colors.blue,
      padding: const EdgeInsets.only(
          top: _textHeightOffset, bottom: _textHeightOffset),
      child: Text(
        '确认付款',
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}

Widget buildView(
    TrainConfirmState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: _bgColor,
    appBar: AppBar(
      title: Text(
        '确认订单',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      leading: GestureDetector(
        onTap: () => dispatch(TrainConfirmActionCreator.onBack()),
        child: Icon(Icons.arrow_back),
      ),
      centerTitle: true,
    ),
    body: ListView(
      children: <Widget>[
        _createTicketWidget(state, dispatch, viewService),
        _createPassengersWidget(state, dispatch, viewService),
        _createAddPassengerBtn(state, dispatch, viewService),
        _createConfirmBtn(state, dispatch, viewService),
      ],
    ),
  );
}
