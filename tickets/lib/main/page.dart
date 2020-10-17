import 'package:fish_redux/fish_redux.dart';
import 'package:tickets/main/center_page/component.dart';
import 'package:tickets/main/main_page/component.dart';
import 'package:tickets/main/message_page/component.dart';
import 'package:tickets/main/order_page/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MainPage extends Page<MainState, Map<String, dynamic>> {
  MainPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<MainState>(
              adapter: null,
              slots: <String, Dependent<MainState>>{
                'main': SearchConnector() + SearchComponent(),
                'message': MessageConnector() + MessageComponent(),
                'order': OrderConnector() + OrderComponent(),
                'center': CenterConnector() + CenterComponent(),
              }),
          middleware: <Middleware<MainState>>[],
        );
}
