import 'package:statemanagement/core/errors/failures.dart';
import 'package:statemanagement/core/helper/api_helper/api_result.dart';
import 'package:statemanagement/features/posts/data/models/post.dart';

abstract interface class PostsRepository {
  Future<ApiResult<List<PostModel>, Failure>> loadPosts();
}
