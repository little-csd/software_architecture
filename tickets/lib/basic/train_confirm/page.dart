import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TrainConfirmPage extends Page<TrainConfirmState, Map<String, dynamic>> {
  TrainConfirmPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<TrainConfirmState>(
                adapter: null,
                slots: <String, Dependent<TrainConfirmState>>{
                }),
            middleware: <Middleware<TrainConfirmState>>[
            ],);

}
