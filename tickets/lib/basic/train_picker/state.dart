import 'package:fish_redux/fish_redux.dart';
import 'package:tickets/proto/train.pb.dart';

class TrainPickerState implements Cloneable<TrainPickerState> {
  String title;
  List<Ticket> tickets;

  @override
  TrainPickerState clone() {
    return TrainPickerState()
      ..title = title
      ..tickets = tickets;
  }
}

TrainPickerState initState(Map<String, dynamic> args) {
  TrainPickerState state = TrainPickerState();
  state.title = '${args['fs']}-${args['ts']}';
  state.tickets = args['tickets'];
  return state;
}
