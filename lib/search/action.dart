import 'package:fish_redux/fish_redux.dart';

enum Actions { clickIcon, submit, input }
class ActionsCreate {
  static Action clickIcon() => const Action(Actions.clickIcon);
  static Action input(String query) => Action(Actions.input, payload: query);
  static Action submit(String query) => Action(Actions.submit, payload: query);
}