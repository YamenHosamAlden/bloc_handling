import 'package:blocstatemangement/core/errors/failures.dart';
import 'package:blocstatemangement/core/helper/api_helper/api_result.dart';
import 'package:blocstatemangement/features/posts/data/models/post_model.dart';

abstract interface class PostsRepository {
  Future<ApiResult<List<PostModel>, Failure>> loadPosts();
}
