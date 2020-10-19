import 'package:fish_redux/fish_redux.dart';

enum TrainPickerAction { click, back }

class TrainPickerActionCreator {
  static Action onBack() {
    return const Action(TrainPickerAction.back);
  }

  static Action onClick(int idx) {
    return Action(TrainPickerAction.click, payload: idx);
  }
}
