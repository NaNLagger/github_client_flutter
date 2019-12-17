import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model.dart';

class Api {
  static String _baseURL = "api.github.com";

  Future<SearchResponse> searchRepositories(
      String query, String sort, String order, int page, int perPage) async {
    var uri = Uri.https(_baseURL, "/search/repositories", {
      "q": query,
      "sort": sort,
      "order": order,
      "page": page.toString(),
      "per_page": perPage.toString()
    });
    http.Response response = await http.get(uri.toString());
    if(response.statusCode != 200)
      throw Exception("Network error? code: ${response.statusCode}, body: ${response.body}");
    return SearchResponse.fromJson(json.decode(response.body));
  }
  
  Future<RepositoryResponse> getRepository(String fullName) async {
    var uri = Uri.https(_baseURL, "/repos/$fullName");
    http.Response response = await http.get(uri.toString());
    if(response.statusCode != 200)
      throw Exception("Network error? code: ${response.statusCode}, body: ${response.body}");
    return RepositoryResponse.fromJson(json.decode(response.body));
  }
}
