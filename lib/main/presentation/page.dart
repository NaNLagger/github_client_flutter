import 'package:fish_redux/fish_redux.dart';
import 'package:github_client_flutter/main/presentation/effect.dart';
import 'package:github_client_flutter/main/presentation/reducer.dart';
import 'package:github_client_flutter/paging/component.dart';
import 'package:github_client_flutter/search/component.dart';
import 'state.dart';
import 'view.dart';

class MainPage extends Page<MainState, void> {
  MainPage(MainEffectBuilder _effect, MainViewBuilder _viewBuilder,
      MainReducerBuilder _reducerBuilder, PagingComponent _pagingComponent)
      : super(
            initState: (void s) {
              return MainState();
            },
            dependencies: Dependencies(slots: {
              'search': SearchConnector() + SearchComponent(),
              'paging': PagingConnector() + _pagingComponent
            }),
            view: _viewBuilder.build,
            reducer: _reducerBuilder.build(),
            effect: _effect.build(),
            middleware: [
              logMiddleware()
            ]);
}
