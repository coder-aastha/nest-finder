import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nest_finder/features/about/data/data_source/local_data_source/about_local_datasource.dart';
import 'package:nest_finder/features/about/data/data_source/remote_data_source/about_remote_data_source.dart';
import 'package:nest_finder/features/about/data/repository/about_repository.dart';
import 'package:nest_finder/features/about/domain/use_case/about_usecase.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nest_finder/app/di/di.dart';
import 'package:nest_finder/core/app_theme/app_theme.dart';

import 'package:nest_finder/features/about/presentation/view/aboutpage_view.dart';
import 'package:nest_finder/features/about/presentation/view_model/about_view_model.dart';

import 'package:nest_finder/features/agent/data/model/agent_model.dart';
import 'package:nest_finder/features/agent/presentation/view/agentpage_view.dart';
import 'package:nest_finder/features/agent/presentation/view/agent_detail_page.dart';
import 'package:nest_finder/features/agent/presentation/view_model/agent_view_model.dart';
import 'package:nest_finder/features/agent/presentation/view_model/agent_detail_view_model.dart';

import 'package:nest_finder/features/auth/data/data_source/property_state.dart';
import 'package:nest_finder/features/contact/view/contactpage_view.dart';
import 'package:nest_finder/features/contact/view_model/contactpage_view_model.dart';

import 'package:nest_finder/features/home/presentation/view_model/profile_state.dart';
import 'package:nest_finder/features/onboarding/view/onboarding_view.dart';
import 'package:nest_finder/features/onboarding/view_model/onboarding_view_model.dart';

import 'package:nest_finder/features/profile/data/data_source/local_data_source/local_data_source.dart';
import 'package:nest_finder/features/profile/data/repository/profile_local_repository.dart';
import 'package:nest_finder/features/profile/domain/usecase/get_profile_usecase.dart';
import 'package:nest_finder/features/profile/domain/usecase/update_profile_usecase.dart';
import 'package:nest_finder/features/profile/presentation/view_model/profile_view_model.dart';

import 'package:nest_finder/features/splash/presentation/view/splash_screen_view.dart';
import 'package:nest_finder/features/splash/presentation/view_model/splash_cubit.dart';

import 'package:http/http.dart' as http;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  // Initialize shared preferences and HTTP client
  final sharedPreferences = await SharedPreferences.getInstance();
  final client = http.Client();

  // Initialize data sources
  final localDataSource = ProfileLocalDataSource(sharedPreferences);
  final localRepository = ProfileLocalRepository(localDataSource);

  runApp(
    MultiProvider(
      providers: [
        // ViewModel Providers
        ChangeNotifierProvider(create: (_) => ProfileState()),
        ChangeNotifierProvider(create: (_) => AboutViewModel()),
        ChangeNotifierProvider(
          create: (_) => ProfileViewModel(
            getProfileUseCase: GetProfileUseCase(localRepository),
            updateProfileUseCase: UpdateProfileUseCase(localRepository),
          )..fetchProfile(),
        ),
        ChangeNotifierProvider(create: (_) => OnboardingViewModel()),
        ChangeNotifierProvider(create: (_) => ContactViewModel()),
        ChangeNotifierProvider(create: (_) => AgentViewModel()),

        // Data Sources
        Provider(create: (_) => AboutLocalDataSourceImpl(sharedPreferences: sharedPreferences)),
        Provider(create: (_) => AboutRemoteDataSourceImpl(client: client)),

        // Repository
        Provider(
          create: (context) => AboutRepositoryImpl(
            remoteDataSource: context.read<AboutRemoteDataSourceImpl>(),
            localDataSource: context.read<AboutLocalDataSourceImpl>(),
          ),
        ),

        // Use Case
        Provider(
          create: (context) => GetAboutUseCase(
            repository: context.read<AboutRepositoryImpl>(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nest Finder',
      theme: AppTheme.getApplicationTheme(isDarkMode: false),
      home: BlocProvider<SplashCubit>(
        create: (context) => getIt<SplashCubit>(),
        child: const SplashScreenView(),
      ),
      routes: {
        '/about': (_) => const AboutPageView(),
        '/profile': (_) => const ProfilePageView(),
        '/onboarding': (_) => const OnboardingView(),
        '/contact': (_) => const ContactPageView(),
        '/agents': (_) => ChangeNotifierProvider(
              create: (_) => AgentViewModel()..fetchAgents(),
              child: const AgentPageView(),
            ),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/agentDetail') {
          final agent = settings.arguments as Agent;
          return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
              create: (_) => AgentDetailViewModel(agent: agent),
              child: AgentDetailPage(agent: agent),
            ),
          );
        }
        return null; // Handles undefined routes
      },
    );
  }
}
