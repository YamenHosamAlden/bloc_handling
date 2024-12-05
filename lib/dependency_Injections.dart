import 'package:blocstatemangement/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:blocstatemangement/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:blocstatemangement/features/posts/domain/repositories/posts_repository.dart';
import 'package:blocstatemangement/features/posts/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt di = GetIt.instance;

Future<void> init() async {
  initRemoteDataSource();
  initRepositories();
  initBlocs();
}

void initRemoteDataSource() {
  di.registerLazySingleton<PostsRemoteDataSource>(
    () => PostsRemoteDataSourceImpl(),
  );
}

void initRepositories() {
  di.registerLazySingleton<PostsRepository>(
    () => PostsRepositoryImpl(
      postsRemoteDataSource: di<PostsRemoteDataSource>(),
    ),
  );
}

void initBlocs() {
  di.registerFactory<PostsBloc>(
      () => PostsBloc(postsRepository: di<PostsRepository>()));
}
