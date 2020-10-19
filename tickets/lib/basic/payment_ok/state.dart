import 'package:fish_redux/fish_redux.dart';

class PaymentOKState implements Cloneable<PaymentOKState> {

  @override
  PaymentOKState clone() {
    return PaymentOKState();
  }
}

PaymentOKState initState(Map<String, dynamic> args) {
  return PaymentOKState();
}
