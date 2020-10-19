import 'package:fish_redux/fish_redux.dart';
import 'package:tickets/proto/passenger.pb.dart';

enum TrainConfirmAction {
  confirm,
  updatePassenger,
  removePassenger,
  clickAddBtn,
  back,
}

class TrainConfirmActionCreator {
  static Action onConfirm() {
    return const Action(TrainConfirmAction.confirm);
  }

  static Action onBack() {
    return const Action(TrainConfirmAction.back);
  }

  static Action onUpdate(List<Passenger> passenger) {
    return Action(TrainConfirmAction.updatePassenger, payload: passenger);
  }

  static Action onRemove(int idx) {
    return Action(TrainConfirmAction.removePassenger, payload: idx);
  }

  static Action onClickAddBtn() {
    return const Action(TrainConfirmAction.clickAddBtn);
  }
}
