import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ChoosePassengerPage extends Page<ChoosePassengerState, Map<String, dynamic>> {
  ChoosePassengerPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ChoosePassengerState>(
                adapter: null,
                slots: <String, Dependent<ChoosePassengerState>>{
                }),
            middleware: <Middleware<ChoosePassengerState>>[
            ],);

}
