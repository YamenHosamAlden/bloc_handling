import 'package:bloc/bloc.dart';
import 'package:myproject/core/errors/error_handling.dart';
import 'package:myproject/core/base_bloc/base_state_bloc.dart';
import 'package:myproject/features/posts/data/models/post.dart';
import 'package:myproject/features/posts/domain/repositories/posts_repository.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostEvent, PostState> {
  final PostsRepository postsRepository;
  PostsBloc({required this.postsRepository}) : super(PostState.initial()) {
    on<LoadPosts>(_onLoadPosts);
  }

  Future<void> _onLoadPosts(LoadPosts event, Emitter<PostState> emit) async {
    emit(state.copyWith(isLoading: true));
    final res = await postsRepository.loadPosts();
    if (res.dataResponse != null) {
      emit(state.copyWith(
          isLoading: false, isError: false, posts: res.dataResponse));
    } else {
      emit(state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: failureHandlingMessage(res.errorResponse!)));
    }
  }

  @override
  void onChange(Change<PostState> change) {
    super.onChange(change);
    print(change);
  }
}
