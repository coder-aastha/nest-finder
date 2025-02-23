import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nest_finder/app/shared_prefs/token_shared_pref.dart';
import 'package:nest_finder/core/common/internet_checker/internet_checker.dart';
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
import 'package:nest_finder/features/onboarding/view_model/onboarding_view_model.dart';
import 'package:nest_finder/features/profile/presentation/view_model/profile_view_model.dart';
import 'package:nest_finder/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initHiveService();
  await _initApiService();
  await _initSharedPreferences();
  await _initInternetChecker();

  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();
  await _initSplashScreenDependencies();
  await _initOnboardingDependencies();
  await _initProfileDependencies();
  await _initContactPageDependencies();
  await _initAgentPageDependencies();
  await _initPropertySearchDependencies();
}

Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<TokenSharedPrefs>(
      () => TokenSharedPrefs(sharedPreferences));
}

Future<void> _initHiveService() async {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

Future<void> _initApiService() async {
  getIt.registerLazySingleton<Dio>(() => ApiService(Dio()).dio);
}

Future<void> _initInternetChecker() async {
  getIt.registerLazySingleton<InternetChecker>(() => InternetChecker());
}

Future<void> _initRegisterDependencies() async {
  getIt
    ..registerLazySingleton<AuthLocalDatasource>(
        () => AuthLocalDatasource(getIt<HiveService>()))
    ..registerFactory<AuthRemoteDataSource>(
        () => AuthRemoteDataSource(getIt<Dio>()))
    ..registerLazySingleton<AuthLocalRepository>(
        () => AuthLocalRepository(getIt<AuthLocalDatasource>()))
    ..registerLazySingleton<AuthRemoteRepository>(
        () => AuthRemoteRepository(getIt<AuthRemoteDataSource>()))
    ..registerLazySingleton<RegisterUseCase>(
        () => RegisterUseCase(getIt<AuthRemoteRepository>()))
    ..registerFactory<RegisterBloc>(
        () => RegisterBloc(registerUseCase: getIt<RegisterUseCase>()));
}

Future<void> _initLoginDependencies() async {
  getIt
    ..registerLazySingleton<LoginUseCase>(() =>
        LoginUseCase(getIt<AuthRemoteRepository>(), getIt<TokenSharedPrefs>()))
    ..registerFactory<LoginBloc>(() => LoginBloc(
          registerBloc: getIt<RegisterBloc>(),
          homeCubit: getIt<HomeCubit>(),
          loginUseCase: getIt<LoginUseCase>(),
        ));
}

Future<void> _initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
}

Future<void> _initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(() => SplashCubit(getIt<LoginBloc>()));
}

Future<void> _initOnboardingDependencies() async {
  getIt.registerFactory<OnboardingViewModel>(() => OnboardingViewModel());
}

Future<void> _initProfileDependencies() async {
  getIt.registerFactory<ProfileViewModel>(() => ProfileViewModel());
}

Future<void> _initContactPageDependencies() async {
  getIt.registerFactory<ContactPageViewModel>(() => ContactPageViewModel());
}

Future<void> _initAgentPageDependencies() async {
  getIt.registerFactory<AgentPageViewModel>(() => AgentPageViewModel());
}

Future<void> _initPropertySearchDependencies() async {
  getIt
    ..registerLazySingleton<PropertyLocalDataSource>(
        () => PropertyLocalDataSource(getIt<HiveService>()))
    ..registerLazySingleton<PropertyRemoteDataSource>(
        () => PropertyRemoteDataSource(getIt<Dio>()))
    ..registerLazySingleton<PropertyRepository>(() => PropertyRepositoryImpl(
          localDataSource: getIt<PropertyLocalDataSource>(),
          remoteDataSource: getIt<PropertyRemoteDataSource>(),
        ))
    ..registerLazySingleton<FetchFilteredPropertiesUseCase>(
        () => FetchFilteredPropertiesUseCase(getIt<PropertyRepository>()))
    ..registerFactory<PropertySearchViewModel>(
        () => PropertySearchViewModel(getIt<FetchFilteredPropertiesUseCase>()));
}
