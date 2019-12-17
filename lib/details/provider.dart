import 'package:github_client_flutter/github/provider.dart';

import 'presentation/effect.dart';
import 'presentation/reducer.dart';
import 'presentation/view.dart';

class DetailsProvider {
  static DetailsEffectBuilder provideMainEffectBuilder() {
    return DetailsEffectBuilder(Provider.provideGithubInteractor());
  }

  static DetailsReducerBuilder provideMainReducerBuilder() {
    return DetailsReducerBuilder();
  }

  static DetailsViewBuilder provideMainViewBuilder() {
    return DetailsViewBuilder();
  }
}