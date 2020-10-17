import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CityPickerPage extends Page<CityPickerState, Map<String, dynamic>> {
  CityPickerPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CityPickerState>(
                adapter: null,
                slots: <String, Dependent<CityPickerState>>{
                }),
            middleware: <Middleware<CityPickerState>>[
            ],);

}
