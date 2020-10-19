import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

const divider = Divider(
  color: Colors.grey,
  thickness: 0,
  height: 0,
);

const _itemHeight = 50.0;
const _itemLeftPadding = 10.0;
final _controller = ScrollController();

Widget _createTypeIndicator(String name) {
  return Container(
    height: _itemHeight,
    alignment: AlignmentDirectional.centerStart,
    padding: EdgeInsets.only(left: _itemLeftPadding),
    color: Color.fromARGB(0xa0, 0xd0, 0xd0, 0xd0),
    child: Text(name),
  );
}

Widget _createCityItem(String name, VoidCallback callback) {
  return GestureDetector(
    onTap: callback,
    child: Container(
      height: _itemHeight,
      color: Colors.white,
      alignment: AlignmentDirectional.centerStart,
      padding: EdgeInsets.only(left: _itemLeftPadding),
      child: Text(
        name,
      ),
    ),
  );
}

Widget _createListWidget(
    CityPickerState state, Dispatch dispatch, ViewService viewService) {
  if (state.itemList == null) return Container();
  return ListView.separated(
    itemBuilder: (ctx, idx) {
      String name = state.itemList[idx].name;
      if (state.itemList[idx].type == CityItemType.acronyms) {
        return _createTypeIndicator(name);
      } else {
        return _createCityItem(name, () {
          print('CityPicker: click item $name');
          dispatch(CityPickerActionCreator.onOk(name));
        });
      }
    },
    separatorBuilder: (ctx, idx) {
      return divider;
    },
    itemCount: state.itemList.length,
    controller: _controller,
  );
}

Widget _createAlphabetList(
    CityPickerState state, Dispatch dispatch, ViewService viewService) {
  if (state.stoneList == null) return Container();
  List<Widget> alphaList = [];
  for (int i = 0; i < 26; i++) {
    String txt = String.fromCharCode(65 + i);
    alphaList.add(Container(
      width: 28,
      height: 28,
      child: MaterialButton(
        onPressed: () {
          print('CityPicker: you click item $txt');
          if (_controller.hasClients) {
            final offset = state.stoneList[i] * _itemHeight;
            _controller.jumpTo(offset);
          }
        },
        child: Text(
          txt,
          textAlign: TextAlign.center,
        ),
        shape: CircleBorder(
            side: BorderSide(color: const Color.fromARGB(0, 0, 0, 0))),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ));
  }
  return Positioned(
    right: 24,
    top: 20,
    child: Column(
      children: alphaList,
    ),
  );
}

Widget buildView(
    CityPickerState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '城市列表',
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.blue,
        ),
        onPressed: () => dispatch(CityPickerActionCreator.onBack()),
      ),
    ),
    body: Stack(
      children: <Widget>[
        _createListWidget(state, dispatch, viewService),
        _createAlphabetList(state, dispatch, viewService),
      ],
    ),
  );
}
