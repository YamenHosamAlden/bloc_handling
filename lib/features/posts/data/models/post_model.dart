import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
 final int userId;
  final int id;
  final String title;
  final String body;
  const  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  @override
  List<Object?> get props => [userId, id, title, body];
}
