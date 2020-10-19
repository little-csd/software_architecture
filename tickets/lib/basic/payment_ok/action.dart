import 'package:fish_redux/fish_redux.dart';

enum PaymentOKAction { back }

class PaymentOKActionCreator {
  static Action onBack() {
    return const Action(PaymentOKAction.back);
  }
}
