import 'package:fish_redux/fish_redux.dart';
import 'package:tickets/main/state.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SearchComponent extends Component<SearchState> {
  SearchComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<SearchState>(
              adapter: null, slots: <String, Dependent<SearchState>>{}),
        );
}

class SearchConnector extends ConnOp<MainState, SearchState> {
  @override
  SearchState get(MainState mainState) {
    SearchState state = SearchState();
    state.data.addAll(mainState.searchData);
    return state;
  }

  @override
  void set(MainState state, SearchState subState) {
    state.searchData = subState.data;
  }
}
