import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:github_client_flutter/search/action.dart';
import 'package:github_client_flutter/search/state.dart';

class SearchViewBuilder {
  var editController = TextEditingController();

  Widget searchView(
      SearchState state, Dispatch dispatch, ViewService viewService) {
    return getInputWidget(state, dispatch);
  }

  TextField getInputWidget(SearchState searchState, Dispatch dispatch) {

    if(searchState.query != editController.text) {
      editController.text = searchState.query;
    }

    return TextField(
      controller: editController,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.white),
          border: InputBorder.none,
          hintText: "Search...",
          hintStyle: TextStyle(color: Colors.white70)),
      cursorColor: Colors.white,
      onSubmitted: (query) {
        dispatch(ActionsCreate.submit(query));
      },
      onChanged: (query) {
        dispatch(ActionsCreate.input(query));
      },
    );
  }
}
