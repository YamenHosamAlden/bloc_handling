import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:statemanagement/core/database/data_base_schema.dart';
import 'package:statemanagement/core/database/local_database.dart';
import 'package:statemanagement/core/helper/network/network.dart';
import 'package:statemanagement/features/posts/data/datasources/posts_local_data_source.dart';
import 'package:statemanagement/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:statemanagement/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:statemanagement/features/posts/domain/repositories/posts_repository.dart';
import 'package:statemanagement/features/posts/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

GetIt di = GetIt.instance;

Future<void> init() async {
  LocalDatabase localDatabase = LocalDatabase(
      databaseName: "post", version: 1, databaseSchema: DatabaseSchema.schema, );
   await localDatabase.databaseInitializer;
  di.registerLazySingleton<LocalDatabase>(() => localDatabase);
  di.registerLazySingleton<InternetConnection>(() => InternetConnection());

  di.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(di<InternetConnection>()));
  di.registerLazySingleton<Dio>(() => Dio()
    ..interceptors.add(PrettyDioLogger(
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
  initLocalDataSource();
  initRemoteDataSource();
  initRepositories();
  initBlocs();
}

void initRemoteDataSource() {
  di.registerLazySingleton<PostsRemoteDataSource>(
    () => PostsRemoteDataSourceImpl(dio: di<Dio>()),
  );
}

void initLocalDataSource() {
  di.registerLazySingleton<PostsLocalDataSource>(
    () => PostsLocalDataSourceImpl(
      localDatabase: di<LocalDatabase>(),
    ),
  );
}

void initRepositories() {
  di.registerLazySingleton<PostsRepository>(
    () => PostsRepositoryImpl(
      networkInfo: di<NetworkInfo>(),
      postsLocalDataSource: di<PostsLocalDataSource>(),
      postsRemoteDataSource: di<PostsRemoteDataSource>(),
    ),
  );
}

void initBlocs() {
  di.registerFactory<PostsBloc>(
      () => PostsBloc(postsRepository: di<PostsRepository>()));
}
