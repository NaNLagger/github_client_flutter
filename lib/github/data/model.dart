class RepositoryResponse {
  RepositoryResponse(
      this.id,
      this.name,
      this.fullName,
      this.owner,
      this.isPrivate,
      this.description,
      this.forksCount,
      this.starCount,
      this.watchersCount);

  final int id;
  final String name;
  final String fullName;
  final UserResponse owner;
  final bool isPrivate;
  final String description;
  final int forksCount;
  final int starCount;
  final int watchersCount;

  RepositoryResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        fullName = json['full_name'],
        owner = UserResponse.fromJson(json['owner']),
        isPrivate = json['private'],
        description = json['description'],
        forksCount = json['forks_count'],
        starCount = json['stargazers_count'],
        watchersCount = json['watchers_count'];
}

class SearchResponse {
  SearchResponse(this.totalCount, this.incompleteResult, this.items);

  final int totalCount;
  final bool incompleteResult;
  final List<RepositoryResponse> items;

  SearchResponse.fromJson(Map<String, dynamic> json)
      : totalCount = json['total_count'],
        incompleteResult = json['incomplete_result'],
        items = (json['items'] as List<dynamic>)
            .map((element) => RepositoryResponse.fromJson(element))
            .toList();
}

class UserResponse {
  UserResponse(this.id, this.login, this.avatarUrl);

  final String login;
  final int id;
  final String avatarUrl;

  UserResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        login = json['login'],
        avatarUrl = json['avatar_url'];
}
