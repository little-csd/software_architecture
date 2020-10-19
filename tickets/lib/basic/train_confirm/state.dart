import 'package:fish_redux/fish_redux.dart';
import 'package:tickets/proto/passenger.pb.dart';
import 'package:tickets/proto/train.pb.dart';

class TrainConfirmState implements Cloneable<TrainConfirmState> {
  Ticket ticket;
  List<Passenger> passengers = List();
  double price = 0;

  @override
  TrainConfirmState clone() {
    return TrainConfirmState()
      ..ticket = ticket
      ..passengers = passengers
      ..price = price;
  }
}

TrainConfirmState initState(Map<String, dynamic> args) {
  TrainConfirmState state = TrainConfirmState();
  state.ticket = args['ticket'];
  state.price = args['price'];
  return state;
}
