import 'package:myproject/core/errors/failures.dart';
import 'package:myproject/core/helper/api_helper/api_result.dart';
import 'package:myproject/features/posts/data/models/post.dart';

abstract interface class PostsRepository {
  Future<ApiResult<List<PostModel>, Failure>> loadPosts();
}
