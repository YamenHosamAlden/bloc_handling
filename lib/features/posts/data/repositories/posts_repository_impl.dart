import 'package:dio/dio.dart';
import 'package:statemanagement/core/errors/failures.dart';
import 'package:statemanagement/core/helper/api_helper/api_result.dart';
import 'package:statemanagement/core/helper/network/network.dart';
import 'package:statemanagement/features/posts/data/datasources/posts_local_data_source.dart';
import 'package:statemanagement/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:statemanagement/features/posts/data/models/post.dart';
import 'package:statemanagement/features/posts/domain/repositories/posts_repository.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostsRemoteDataSource postsRemoteDataSource;
  final PostsLocalDataSource postsLocalDataSource;
  NetworkInfo networkInfo;
  PostsRepositoryImpl({
    required this.postsRemoteDataSource,
    required this.postsLocalDataSource,
    required this.networkInfo,
  });
  List<PostModel>? _postModelList;

  @override
  Future<ApiResult<List<PostModel>, Failure>> loadPosts() async {
    try {
      if (!await networkInfo.isConnected) {
        _postModelList = await postsLocalDataSource.getPosts();
        return ApiResult.withSuccess(_postModelList ?? []);
      }
      _postModelList = await postsRemoteDataSource.fetchPostData();
      _postModelList?.forEach((element) async {
        await postsLocalDataSource.insertPost(element);
      });
    } on DioException catch (error) {
      return ApiResult.withError(DioFailure(error: error));
    } catch (error) {
      print("what is the error $error");
      return ApiResult.withError(UnknowFailure());
    }
    return ApiResult.withSuccess(_postModelList ?? []);
  }
}
