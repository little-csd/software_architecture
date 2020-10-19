import 'package:tickets/proto/passenger.pb.dart';
import 'package:tickets/proto/train.pb.dart';

// id = null 表示还未登录
var id = '13129639964';
// final passengers = createFakePassengerList();

TrainRsp createFakeTrainRsp(String fs, String ts) {
  TrainRsp rsp = TrainRsp();
  for (int i = 0; i < 10; i++) {
    Ticket ticket = Ticket();
    ticket.kid = 'G10$i';
    ticket.fStation = fs;
    ticket.tStation = ts;
    ticket.fTime = '1$i:00';
    ticket.tTime = '1${i + 1}:00';
    ticket.duration = '01:00';
    ticket.tid = 'ticket_G23420000';
    rsp.tickets.add(ticket);
  }
  return rsp;
}

PriceRsp createFakePriceRsp(String id, String tid) {
  PriceRsp rsp = PriceRsp();
  rsp.prices..add('¥100')..add('¥500')..add('¥300');
  return rsp;
}

List<Passenger> createFakePassengerList() {
  List<Passenger> list = List();
  for (int i = 0; i < 3; i++) {
    Passenger passenger = Passenger();
    passenger.name = '蔡思涤';
    passenger.male = true;
    passenger.idCard = '440123199906223012';
    list.add(passenger);
  }
  return list;
}
