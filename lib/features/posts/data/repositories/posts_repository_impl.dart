import 'package:dio/dio.dart';
import 'package:myproject/core/errors/failures.dart';
import 'package:myproject/core/helper/api_helper/api_result.dart';
import 'package:myproject/core/helper/network/network_info.dart';
import 'package:myproject/features/posts/data/datasources/posts_local_data_source.dart';
import 'package:myproject/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:myproject/features/posts/data/models/post.dart';
import 'package:myproject/features/posts/domain/repositories/posts_repository.dart';

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
    if (await networkInfo.isConnected) {
      try {
        if (await networkInfo.isConnected) {}
        _postModelList = await postsRemoteDataSource.fetchPostData();
        return ApiResult.withSuccess(_postModelList ?? []);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } catch (error) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withSuccess(_postModelList ?? []);
  }
}
