part of 'posts_bloc.dart';

class PostState extends BaseBlocState {
  final List<PostModel> posts;
  const PostState(
      {required super.hasError,
      required super.hasLoading,
      required this.posts,
      super.errorMessage});
  PostState.initial()
      : this(hasLoading: false, posts: <PostModel>[], hasError: false);

  PostState copyWith(
          {bool? isLoading,
          List<PostModel>? posts,
          bool? isError,
          String? errorMessage}) =>
      PostState(
        hasLoading: isLoading ?? super.isLoading,
        posts: posts ?? this.posts,
        hasError: isError ?? super.isError,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get stateProps => [
        posts,
      ];
}
