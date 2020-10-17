import 'package:fish_redux/fish_redux.dart';

class CityPickerState implements Cloneable<CityPickerState> {
  List<CityItem> itemList;
  List<int> stoneList; // 第 i 个字母前共有多少个 item

  @override
  CityPickerState clone() {
    return CityPickerState();
  }
}

CityPickerState initState(Map<String, dynamic> args) {
  return CityPickerState();
}

enum CityItemType {
  city,
  acronyms,
}

class CityItem {
  final CityItemType type;
  final String name;

  CityItem(
    this.type,
    this.name,
  );
}
