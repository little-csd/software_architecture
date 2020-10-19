import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TrainPickerPage extends Page<TrainPickerState, Map<String, dynamic>> {
  TrainPickerPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<TrainPickerState>(
                adapter: null,
                slots: <String, Dependent<TrainPickerState>>{
                }),
            middleware: <Middleware<TrainPickerState>>[
            ],);

}
