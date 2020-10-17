import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CenterAction { action }

class CenterActionCreator {
  static Action onAction() {
    return const Action(CenterAction.action);
  }
}
