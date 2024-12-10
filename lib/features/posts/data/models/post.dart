
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class PostModel with _$PostModel {

  const factory PostModel({
    required  int userId,
    required  int id,
    required  String title,
    required  String body,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

      
}
