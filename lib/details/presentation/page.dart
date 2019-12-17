import 'package:fish_redux/fish_redux.dart';
import 'package:github_client_flutter/details/presentation/effect.dart';
import 'package:github_client_flutter/details/presentation/reducer.dart';
import 'package:github_client_flutter/details/presentation/state.dart';
import 'package:github_client_flutter/details/presentation/view.dart';

class DetailsPage extends Page<DetailsState, String> {
  DetailsPage(DetailsViewBuilder viewBuilder,
      DetailsReducerBuilder reducerBuilder, DetailsEffectBuilder effectBuilder)
      : super(
            initState: (String fullName) {
              return DetailsState(fullName);
            },
            view: viewBuilder.build,
            reducer: reducerBuilder.build(),
            effect: effectBuilder.build(),);
}
