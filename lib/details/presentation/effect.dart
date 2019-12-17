import 'package:fish_redux/fish_redux.dart';
import 'package:github_client_flutter/base/builders.dart';
import 'package:github_client_flutter/details/presentation/action.dart';
import 'package:github_client_flutter/details/presentation/state.dart';
import 'package:github_client_flutter/github/domain/interactor.dart';

class DetailsEffectBuilder extends EffectBuilder<DetailsState> {
  DetailsEffectBuilder(this._interactor);

  final GithubInteractor _interactor;

  @override
  build() {
    return combineEffects({
      Lifecycle.initState: _loadRepository
    });
  }

  Future<void> _loadRepository(Action action, Context<DetailsState> context) async {
    var response = await _interactor.getRepository(context.state.fullName);
    context.dispatch(DetailsActionCreate.loaded(response));
  }

}