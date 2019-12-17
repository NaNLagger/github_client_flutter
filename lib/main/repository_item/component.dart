import 'package:fish_redux/fish_redux.dart';
import 'package:github_client_flutter/main/repository_item/state.dart';
import 'package:github_client_flutter/main/repository_item/view.dart';

class RepositoryItemComponent extends Component<RepositoryItemState> {
  RepositoryItemComponent(RepositoryItemViewBuilder _viewBuilder) : super(
    view: _viewBuilder.build,
  );
}