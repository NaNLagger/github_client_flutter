import 'package:fish_redux/src/redux_component/basic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:github_client_flutter/base/builders.dart' as builders;
import 'package:github_client_flutter/github/domain/model.dart';
import 'package:github_client_flutter/main/repository_item/state.dart';

class RepositoryItemViewBuilder extends builders.ViewBuilder<RepositoryItemState> {

  @override
  Widget build(RepositoryItemState state, dispatch, ViewService viewService) {
    var item = state.repositoryModel;
    return _getListItem(item);
  }

  Widget _getListItem(RepositoryModel item) {
    return Card(
        child: Container(
            child: Row(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.all(16.0),
                    child: Image.network(
                      item.user.avatarUrl,
                      width: 40,
                      height: 40,
                    )),
                Flexible(
                    child: Container(
                        margin: const EdgeInsets.only(top: 16.0, right: 16.0, bottom: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              item.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              item.description != null ? item.description : "",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            )
                          ],
                        )))
              ],
            )));
  }
}