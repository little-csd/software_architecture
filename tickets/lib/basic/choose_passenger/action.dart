import 'package:fish_redux/fish_redux.dart';
import 'package:tickets/proto/passenger.pb.dart';

enum ChoosePassengerAction {
  confirm,
  addMore,
  back,
  choose,
  add,
}

class ChoosePassengerActionCreator {
  static Action onConfirm() {
    return const Action(ChoosePassengerAction.confirm);
  }

  static Action onBack() {
    return const Action(ChoosePassengerAction.back);
  }

  static Action onAddMore() {
    return const Action(ChoosePassengerAction.addMore);
  }

  static Action onChoose(int idx) {
    return Action(ChoosePassengerAction.choose, payload: idx);
  }

  static Action onAdd(List<Passenger> passengers) {
    return Action(ChoosePassengerAction.add, payload: passengers);
  }
}
