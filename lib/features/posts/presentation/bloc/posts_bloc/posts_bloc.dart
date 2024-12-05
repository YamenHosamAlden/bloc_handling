import 'package:bloc/bloc.dart';
import 'package:blocstatemangement/core/errors/error_handling.dart';
import 'package:blocstatemangement/core/helper/bloc_helper/base_state_bloc.dart';
import 'package:blocstatemangement/features/posts/data/models/post_model.dart';
import 'package:blocstatemangement/features/posts/domain/repositories/posts_repository.dart';
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
