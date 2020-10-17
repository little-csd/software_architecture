import 'package:fish_redux/fish_redux.dart';
import 'package:tickets/main/state.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class OrderComponent extends Component<OrderState> {
  OrderComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<OrderState>(
              adapter: null, slots: <String, Dependent<OrderState>>{}),
        );
}

class OrderConnector extends ConnOp<MainState, OrderState> {
  @override
  OrderState get(MainState state) {
    return OrderState();
  }

  @override
  void set(MainState state, OrderState subState) {}
}
