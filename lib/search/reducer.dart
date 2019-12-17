import 'package:fish_redux/fish_redux.dart';
import 'package:github_client_flutter/search/action.dart';
import 'package:github_client_flutter/search/state.dart';

Reducer<SearchState> buildClickerReducer() {
  return asReducer({
    Actions.input: (state, action) =>
        state.clone()..query = (action.payload as String),
    Actions.submit: (state, action) => state.clone()
      ..isKeyboardOpen = false
      ..isFocused = false,
    Actions.clickIcon: (state, action) {
      if (state.isExpanded) {
        if (state.query.isNotEmpty) {
          return state.clone()..query = "";
        } else {
          return state.clone()..isExpanded = false;
        }
      } else {
        return state.clone()..isExpanded = true;
      }
    }
  });
}
