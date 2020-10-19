import 'package:fish_redux/fish_redux.dart';
import 'package:tickets/proto/passenger.pb.dart';

class ChoosePassengerState implements Cloneable<ChoosePassengerState> {
  List<Passenger> _passengers = List();
  List<bool> _chosen = List();

  @override
  ChoosePassengerState clone() {
    return ChoosePassengerState()
      .._chosen = _chosen
      .._passengers = _passengers;
  }

  void addPassenger(Passenger data) {
    _passengers.add(data);
    _chosen.add(false);
  }

  void addPassengers(List<Passenger> data) {
    print('AddPassenger: add passengers length ${data.length}');
    data.forEach((element) {
      _passengers.add(element);
      _chosen.add(false);
    });
  }

  bool isChosen(int idx) {
    return _chosen[idx];
  }

  List<Passenger> getAllChosenPassengers() {
    List<Passenger> passengerList = List();
    int siz = _chosen.length;
    for (int i = 0; i < siz; i++) {
      if (_chosen[i]) {
        passengerList.add(_passengers[i]);
      }
    }
    return passengerList;
  }

  List<Passenger> getAllPassengers() {
    return _passengers;
  }

  void clickItem(int idx) {
    if (idx > _chosen.length || idx < 0) {
      print('AddPassenger: error for click index $idx');
      return;
    }
    _chosen[idx] = !_chosen[idx];
  }
}

ChoosePassengerState initState(Map<String, dynamic> args) {
  return ChoosePassengerState();
}
