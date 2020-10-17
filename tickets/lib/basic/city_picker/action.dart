import 'package:fish_redux/fish_redux.dart';

enum CityPickerAction { ok, back, init }

class CityPickerActionCreator {
  static Action onOk(String name) {
    return Action(CityPickerAction.ok, payload: name);
  }

  static Action onBack() {
    return const Action(CityPickerAction.back);
  }

  static Action onInit(Map<String, dynamic> map) {
    return Action(CityPickerAction.init, payload: map);
  }
}
