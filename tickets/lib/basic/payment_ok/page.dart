import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'state.dart';
import 'view.dart';

class PaymentOKPage extends Page<PaymentOKState, Map<String, dynamic>> {
  PaymentOKPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            view: buildView,
            dependencies: Dependencies<PaymentOKState>(
                adapter: null,
                slots: <String, Dependent<PaymentOKState>>{
                }),
            middleware: <Middleware<PaymentOKState>>[
            ],);

}
