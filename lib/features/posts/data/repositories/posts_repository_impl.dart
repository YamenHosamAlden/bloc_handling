import 'package:blocstatemangement/core/errors/exceptions.dart';
import 'package:blocstatemangement/core/errors/failures.dart';
import 'package:blocstatemangement/core/helper/api_helper/api_result.dart';
import 'package:blocstatemangement/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:blocstatemangement/features/posts/data/models/post.dart';
import 'package:blocstatemangement/features/posts/domain/repositories/posts_repository.dart';

class PostsRepositoryImpl implements PostsRepository {
  PostsRemoteDataSource postsRemoteDataSource;
  PostsRepositoryImpl({required this.postsRemoteDataSource});
  List<PostModel>? _postModelList;
  @override
  Future<ApiResult<List<PostModel>, Failure>> loadPosts() async {
    try {
      _postModelList = await postsRemoteDataSource.fetchPostData();
  
    } on ServerException {
      return ApiResult.withError(ServerFailure());
    } catch (error) {
      print(error);
      return ApiResult.withError(UnknowFailure());
    }

    return ApiResult.withSuccess(_postModelList ?? []);
  }
}
