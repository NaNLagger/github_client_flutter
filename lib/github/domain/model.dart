class RepositoryModel {
  RepositoryModel(this.fullName, this.user, this.name, this.description);

  final String fullName;
  final String name;
  final UserModel user;
  final String description;
}

class UserModel {
  UserModel(this.id, this.login, this.avatarUrl);

  final String login;
  final int id;
  final String avatarUrl;
}