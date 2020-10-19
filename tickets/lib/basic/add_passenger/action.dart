import 'package:fish_redux/fish_redux.dart';

enum AddPassengerAction { confirm, back, stateChange, chooseType }

class AddPassengerActionCreator {
  static Action onBack() {
    return const Action(AddPassengerAction.back);
  }

  static Action onConfirm() {
    return const Action(AddPassengerAction.confirm);
  }

  static Action onStateChange(Map<String, dynamic> data) {
    return Action(AddPassengerAction.stateChange, payload: data);
  }

  static Action onChooseType() {
    return const Action(AddPassengerAction.chooseType);
  }
}
