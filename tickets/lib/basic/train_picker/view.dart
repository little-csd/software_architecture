import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:tickets/basic/train_picker/action.dart';
import 'package:tickets/proto/train.pb.dart';

import 'state.dart';

const _itemPadding = 10.0;
const _color = Color.fromARGB(0xa0, 0xe0, 0xe0, 0xe0);
const _timeFontSize = 26.0;
final _lightTextStyle = TextStyle(
  fontSize: 13,
  color: const Color.fromARGB(0x7f, 0, 0, 0),
);

Widget _createStationPart(String time, String name, String iconPath) {
  return Column(
    children: <Widget>[
      Text(
        time,
        style: TextStyle(
          fontSize: _timeFontSize,
        ),
      ),
      RichText(
        text: TextSpan(children: [
          WidgetSpan(
            child: Image.asset(
              iconPath,
              width: 18,
              height: 18,
            ),
          ),
          TextSpan(text: ' $name', style: TextStyle(color: Colors.black)),
        ]),
      ),
    ],
  );
}

String _reformatDuration(String duration) {
  if (duration == null || duration.length < 5) {
    print('TrainPicker: reformat error!');
    return duration;
  }
  return '${duration.substring(0, 2)}时${duration.substring(3, 5)}分';
}

Widget _createTrainPart(String duration, String name) {
  return Column(
    children: <Widget>[
      Text(
        duration,
        style: _lightTextStyle,
      ),
      Image.asset(
        'assets/long_arrow.png',
        width: 105,
        height: 15,
      ),
      Text(
        name,
        style: _lightTextStyle,
      ),
    ],
  );
}

Widget _createTicketWidget(TrainPickerState state, Dispatch dispatch,
    ViewService viewService, int idx) {
  Ticket ticket = state.tickets[idx];
  return Padding(
    padding: EdgeInsets.only(
        left: _itemPadding, right: _itemPadding, top: _itemPadding),
    child: FlatButton(
      onPressed: () {
        print('TrainPicker: click widget $idx');
        dispatch(TrainPickerActionCreator.onClick(idx));
      },
      color: Colors.white,
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _createStationPart(
                ticket.fTime, ticket.fStation, 'assets/fStation.png'),
          ),
          Expanded(
            flex: 1,
            child: _createTrainPart(
                _reformatDuration(ticket.duration), ticket.kid),
          ),
          Expanded(
            flex: 1,
            child: _createStationPart(
                ticket.tTime, ticket.tStation, 'assets/tStation.png'),
          ),
        ],
      ),
    ),
  );
}

Widget buildView(
    TrainPickerState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => dispatch(TrainPickerActionCreator.onBack()),
        ),
        title: Text(state.title)),
    body: Container(
      color: _color,
      child: ListView.builder(
        itemBuilder: (ctx, idx) =>
            _createTicketWidget(state, dispatch, viewService, idx),
        itemCount: state.tickets.length,
      ),
    ),
  );
}
