import 'package:fish_redux/fish_redux.dart';
import 'package:github_client_flutter/paging/reducer.dart';
import 'package:github_client_flutter/paging/view.dart';

import 'state.dart';

class PagingComponent extends Component<PagingListState> {
  PagingComponent(
      PagingListViewBuilder _viewBuilder,
      PagingListReducerBuilder _reducerBuilder,
      SourceFlowAdapter<PagingListState> _adapter)
      : super(
            reducer: _reducerBuilder.build(),
            view: _viewBuilder.build,
            dependencies:
                Dependencies(adapter: NoneConn<PagingListState>() + _adapter));
}
