import 'dart:convert';

import 'package:blocstatemangement/core/errors/exceptions.dart';
import 'package:blocstatemangement/features/posts/data/models/post_model.dart';
import 'package:http/http.dart' as http;

abstract interface class PostsRemoteDataSource {
  Future<List<PostModel>> fetchPostData();
}

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  @override
  Future<List<PostModel>> fetchPostData() async {
    http.Response response = await http.Client()
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((post) => PostModel.fromJson(post))
          .toList();
    }
    throw (ServerException());
  }
}
