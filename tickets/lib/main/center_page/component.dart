import 'package:fish_redux/fish_redux.dart';
import 'package:tickets/main/state.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CenterComponent extends Component<CenterState> {
  CenterComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<CenterState>(
              adapter: null, slots: <String, Dependent<CenterState>>{}),
        );
}

class CenterConnector extends ConnOp<MainState, CenterState> {
  @override
  CenterState get(MainState state) {
    return CenterState();
  }

  @override
  void set(MainState state, CenterState subState) {}
}
