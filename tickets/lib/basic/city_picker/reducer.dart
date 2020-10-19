import 'package:fish_redux/fish_redux.dart';
import 'package:tickets/basic/city_picker/action.dart';

import 'state.dart';

Reducer<CityPickerState> buildReducer() {
  return asReducer(
    <Object, Reducer<CityPickerState>>{
      CityPickerAction.init: _onInit,
    },
  );
}

CityPickerState _onInit(CityPickerState state, Action action) {
  final CityPickerState newState = state.clone();
  Map<String, dynamic> data = action.payload;
  List<CityItem> itemList = new List();
  data.forEach((key, value) {
    itemList.add(CityItem(CityItemType.acronyms, key));
    value.forEach((element) {
      itemList.add(CityItem(CityItemType.city, element));
    });
    // print('CityPicker: key = $key, len = ${value.length}');
  });
  newState.itemList = itemList;
  print(
      'CityPicker: read cities from local, total length = ${itemList.length}');

  List<int> stoneList = new List(26)..fillRange(0, 26, 0);
  for (int i = 1; i < 26; i++) {
    String str = String.fromCharCode(i + 64);
    final len = data[str] == null ? 0 : data[str].length + 1;
    stoneList[i] = stoneList[i - 1] + len;
  }
  newState.stoneList = stoneList;
  print('CityPicker: $stoneList');

  return newState;
}
