import 'package:fish_redux/fish_redux.dart';
import 'package:tickets/network/global.dart';

class SearchState implements Cloneable<SearchState> {
  Map<String, dynamic> data = new Map()
    ..['id'] = id
    ..['b_student'] = false
    ..['b_bullet'] = false;

  @override
  SearchState clone() {
    print('cloning...');
    SearchState newState = new SearchState();
    newState.data.addAll(data);
    return newState;
  }

  void update(Map<String, dynamic> newData) {
    data.addAll(newData);
  }
}

SearchState initState(Map<String, dynamic> args) {
  print('state init');
  return SearchState();
}
