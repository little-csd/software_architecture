import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AddPassengerPage extends Page<AddPassengerState, Map<String, dynamic>> {
  AddPassengerPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AddPassengerState>(
                adapter: null,
                slots: <String, Dependent<AddPassengerState>>{
                }),
            middleware: <Middleware<AddPassengerState>>[
            ],);

}
