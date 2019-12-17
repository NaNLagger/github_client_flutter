import 'package:github_client_flutter/github/data/model.dart';
import 'package:github_client_flutter/github/domain/model.dart';

class RepositoryMapper {
  RepositoryMapper(this._userMapper);

  final UserMapper _userMapper;

  RepositoryModel map(RepositoryResponse response) {
    return RepositoryModel(response.fullName, _userMapper.map(response.owner),
        response.name, response.description);
  }
}

class UserMapper {
  UserModel map(UserResponse response) {
    return UserModel(response.id, response.login, response.avatarUrl);
  }
}
