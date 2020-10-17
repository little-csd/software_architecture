import 'package:fish_redux/fish_redux.dart';

enum MainAction { pageChange }

class MainActionCreator {
  static Action onPageChange(int index) {
    return Action(MainAction.pageChange, payload: index);
  }
}
