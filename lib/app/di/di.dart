import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nest_finder/core/network/api_service.dart';
import 'package:nest_finder/core/network/hive_service.dart';
import 'package:nest_finder/features/auth/data/data_source/local_data_source/auth_local_datasource.dart';
import 'package:nest_finder/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:nest_finder/features/auth/data/repository/auth_local_repository/auth_local_repository.dart';
import 'package:nest_finder/features/auth/data/repository/remote_repository/auth_remote_repository.dart';
import 'package:nest_finder/features/auth/domain/use_case/login_usecase.dart';
import 'package:nest_finder/features/auth/domain/use_case/register_usecase.dart';
import 'package:nest_finder/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:nest_finder/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:nest_finder/features/home/presentation/view_model/home_cubit.dart';
import 'package:nest_finder/features/splash/presentation/view_model/splash_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // First initialize hive service
  await _initHiveService();
  await _initApiService();

  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();

  await _initSplashScreenDependencies();
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initApiService(){
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}

_initRegisterDependencies() {
  // init local data source
  getIt.registerLazySingleton(
    () => AuthLocalDatasource(getIt<HiveService>()),
  );

  // init remote data source
  getIt.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(
      getIt<Dio>(),
    ),
  );

  // init local repository
  getIt.registerLazySingleton(
    () => AuthLocalRepository(getIt<AuthLocalDatasource>()),
  );

  // init remote repository
  getIt.registerLazySingleton(
    () => AuthRemoteRepository(
      getIt<AuthRemoteDataSource>()
      ),
  );

  // register use usecase
  // getIt.registerLazySingleton<RegisterUseCase>(
  //   () => RegisterUseCase(
  //     getIt<AuthLocalRepository>(),
  //   ),
  // );
   getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUseCase: getIt(),
    ),
  );
}


_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}

_initLoginDependencies() async {
  // getIt.registerLazySingleton<LoginUseCase>(
  //   () => LoginUseCase(
  //     getIt<AuthLocalRepository>(),
  //   ),
  // );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      loginUseCase: getIt<LoginUseCase>(),
    ),
  );
}

_initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<LoginBloc>()),
  );
}
