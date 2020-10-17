import 'package:fish_redux/fish_redux.dart';

enum SearchAction { search, stateChange, datePicker, chooseStation, submit }

class SearchActionCreator {
  static Action onStateChange(Map<String, dynamic> update) {
    return Action(SearchAction.stateChange, payload: update);
  }

  static Action onSearch() {
    return const Action(SearchAction.search);
  }

  static Action onOpenDatePicker() {
    return Action(SearchAction.datePicker);
  }

  static Action onOpenStation(String arg) {
    return Action(SearchAction.chooseStation, payload: arg);
  }

  static Action onSubmit() {
    return const Action(SearchAction.submit);
  }
}
