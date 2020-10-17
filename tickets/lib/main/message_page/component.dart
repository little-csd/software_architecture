import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MessageComponent extends Component<MessageState> {
  MessageComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<MessageState>(
              adapter: null, slots: <String, Dependent<MessageState>>{}),
        );
}

class MessageConnector extends ConnOp<MainState, MessageState> {
  @override
  MessageState get(MainState state) {
    return MessageState();
  }

  @override
  void set(MainState state, MessageState subState) {}
}
