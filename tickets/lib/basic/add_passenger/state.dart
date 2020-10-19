import 'package:fish_redux/fish_redux.dart';
import 'package:tickets/proto/passenger.pb.dart';

class AddPassengerState implements Cloneable<AddPassengerState> {
  Map<String, dynamic> _data = Map();

  @override
  AddPassengerState clone() {
    return AddPassengerState().._data = _data;
  }

  void update(Map<String, dynamic> newData) {
    _data.addAll(newData);
  }

  Passenger buildPassenger() {
    Passenger passenger = Passenger();
    passenger.name = _data['name'];
    passenger.male = true;
    passenger.idCard = _data['idCard'];
    if (_checkValid(passenger))
      return passenger;
    else
      return null;
  }

  bool _checkValid(Passenger passenger) {
    if (passenger.name == null ||
        passenger.idCard == null ||
        passenger.male == null) return false;
    if (passenger.name.length == 0 || passenger.idCard.length != 18) {
      return false;
    }
    return true;
  }
}

AddPassengerState initState(Map<String, dynamic> args) {
  return AddPassengerState();
}
