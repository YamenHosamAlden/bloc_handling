// import 'dart:convert';

import 'package:statemanagement/core/errors/exceptions.dart';
import 'package:statemanagement/features/posts/data/models/post.dart';
import 'package:dio/dio.dart' as d;
// import 'package:http/http.dart' as http;

abstract interface class PostsRemoteDataSource {
  Future<List<PostModel>> fetchPostData();
}

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  final d.Dio dio;

  PostsRemoteDataSourceImpl({required this.dio});

  //fetch data with http
  // @override
  // Future<List<PostModel>> fetchPostData() async {
  //   http.Response response = await http.Client()
  //       .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  //   if (response.statusCode == 200) {
  //     return (jsonDecode(response.body) as List)
  //         .map((post) => PostModel.fromJson(post))
  //         .toList();
  //   }
  //   throw (ServerException());
  // }

  //fetch data with dio
  @override
  Future<List<PostModel>> fetchPostData() async {
    d.Response response =
        await dio.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((post) {
            return PostModel.fromJson(post);
          })
          .toList();
    }
    throw (ServerException());
  }
}
