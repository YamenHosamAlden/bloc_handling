import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myproject/app/data/datasources/app_local_data_source.dart';
import 'package:myproject/app/data/repositories/app_repository_impl.dart';
import 'package:myproject/app/domain/repositories/app_repository.dart';
import 'package:myproject/app/presentation/app_bloc/app_bloc.dart';
import 'package:myproject/core/database/data_base_schema.dart';
import 'package:myproject/core/database/local_database.dart';
import 'package:myproject/core/helper/network/network_info.dart';
import 'package:myproject/features/posts/data/datasources/posts_local_data_source.dart';
import 'package:myproject/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:myproject/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:myproject/features/posts/domain/repositories/posts_repository.dart';
import 'package:myproject/features/posts/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

GetIt di = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  di.registerSingleton<SharedPreferences>(sharedPreferences);

  // First way to initialize local database
  // LocalDatabase localDatabase = LocalDatabase(
  //   databaseName: "local_data_base",
  //   version: 1,
  //   databaseSchema: DatabaseSchema.schema,
  // );
  // await localDatabase.databaseInitializer;
  // di.registerLazySingleton<LocalDatabase>(() => localDatabase);

  // Second way to initialize local database
  di.registerSingletonAsync<LocalDatabase>(
    () async => LocalDatabase(
      databaseName: "local_data_base",
      version: 1,
      databaseSchema: DatabaseSchema.sqlQueries,
    )..databaseInitializer,
  );

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
  di.registerLazySingleton<AppLocalDataSource>(
    () => AppLocalDataSourceImpl(
      sharedPreferences: di<SharedPreferences>(),
    ),
  );
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

  di.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(
      appLocalDataSource: di<AppLocalDataSource>(),
    ),
  );
}

void initBlocs() {
  di.registerFactory<AppBloc>(
    () => AppBloc(
      appRepository: di<AppRepository>(),
    ),
  );

  di.registerFactory<PostsBloc>(
    () => PostsBloc(
      postsRepository: di<PostsRepository>(),
    ),
  );
}
