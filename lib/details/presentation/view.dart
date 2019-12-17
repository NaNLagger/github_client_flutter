import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:github_client_flutter/base/builders.dart' as builders;
import 'state.dart';

class DetailsViewBuilder extends builders.ViewBuilder<DetailsState> {
  @override
  Widget build(DetailsState state, dispatch, ViewService viewService) {
    return Scaffold(
      appBar: AppBar(
        title: Text(state.fullName),
      ),
      body: Center(child: Text("тут будет контент или нет"),),
    );
  }
}