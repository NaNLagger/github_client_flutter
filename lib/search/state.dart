import 'package:fish_redux/fish_redux.dart';

class SearchState implements Cloneable<SearchState> {
  bool isExpanded = false;
  bool isFocused = false;
  bool isKeyboardOpen = false;
  String query = "";

  @override
  SearchState clone() {
    return SearchState()
      ..isExpanded = isExpanded
      ..isFocused = isFocused
      ..isKeyboardOpen = isKeyboardOpen
      ..query = query;
  }
}
