import 'package:sqflite/sqflite.dart';
import 'package:statemanagement/core/database/local_database.dart';
import 'package:statemanagement/features/posts/data/models/post.dart';

abstract interface class PostsLocalDataSource {
  Future<int> insertPost(PostModel post);
  Future<int> deletePost(PostModel post);
  Future<int> updatePost(PostModel post);
  Future<List<PostModel>?> getPosts();
  Future<PostModel?> getPost(int postId);
}

class PostsLocalDataSourceImpl implements PostsLocalDataSource {
  LocalDatabase localDatabase;
  PostsLocalDataSourceImpl({
    required this.localDatabase,
  });
  @override
  Future<int> deletePost(PostModel post) async {
    Database db = localDatabase.database;
    return await db.insert(
      'Post',
      post.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<PostModel?> getPost(int postId) async {
    final db = localDatabase.database;
    var post = await db.query('Post', where: 'id = ?', whereArgs: [postId]);
    PostModel? postById =
        post.map((json) => PostModel.fromJson(json)).toList().first;
    return postById;
  }

  @override
  Future<List<PostModel>?> getPosts() async {
    Database db = localDatabase.database;
    final List<Map<String, Object?>> postMaps = await db.query('Post');

    if (postMaps.isEmpty) {
      return null;
    }

    // return (postMaps as List).map((json) => PostModel.fromJson(json)).toList();

    return List.generate(
        postMaps.length, (index) => PostModel.fromJson(postMaps[index]));
  }

  @override
  Future<int> insertPost(PostModel post) async {
    Database db = localDatabase.database;
    return await db.insert(
      'Post',
      post.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<int> updatePost(PostModel post) async {
    Database db = localDatabase.database;
    return await db.update(
      'Post',
      post.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
      where: 'id = ?',
      whereArgs: [post.id],
    );
  }
}
