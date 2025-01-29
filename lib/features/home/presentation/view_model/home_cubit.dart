import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nest_finder/app/di/di.dart';
import 'package:nest_finder/features/auth/presentation/view/login_page_view.dart';
import 'package:nest_finder/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:nest_finder/features/home/presentation/view_model/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  // Method to update the currentPage based on the tab index
  void onTabTapped(int index) {
    // Update currentPage instead of selectedIndex
    emit(state.copyWith(currentPage: DrawerSection.values[index]));
  }

  void logout(BuildContext context) {
    // Wait for 2 seconds
    Future.delayed(const Duration(seconds: 2), () async {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: getIt<LoginBloc>(),
              child: const LoginPageView(),
            ),
          ),
        );
      }
    });
  }
}
