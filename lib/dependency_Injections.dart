import 'package:blocstatemangement/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:blocstatemangement/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:blocstatemangement/features/posts/domain/repositories/posts_repository.dart';
import 'package:blocstatemangement/features/posts/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

GetIt di = GetIt.instance;

Future<void> init() async {

  
  di.registerLazySingleton<Dio>(() => Dio()..interceptors.add(PrettyDioLogger(
        requestHeader: false,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        
        // filter: (options, args){
        //     // don't print requests with uris containing '/posts' 
        //     if(options.path.contains('/posts')){
        //       return false;
        //     }
        //     // don't print responses with unit8 list data
        //     return !args.isResponse || !args.hasUint8ListData;
        //   }
      )));
  initRemoteDataSource();
  initRepositories();
  initBlocs();
}

void initRemoteDataSource() {
  di.registerLazySingleton<PostsRemoteDataSource>(
    () => PostsRemoteDataSourceImpl(dio: di<Dio>()),
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
