import 'package:fish_redux/fish_redux.dart';
import 'package:github_client_flutter/search/reducer.dart';
import 'package:github_client_flutter/search/state.dart';
import 'package:github_client_flutter/search/view.dart';

class SearchComponent extends Component<SearchState> {
  SearchComponent() : super(
    reducer: buildClickerReducer(),
    view: SearchViewBuilder().searchView,
  );
}