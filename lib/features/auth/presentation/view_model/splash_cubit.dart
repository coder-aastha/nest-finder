// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nest_finder/features/home/presentation/view/onboarding_view.dart';

// class SplashCubit extends Cubit<void> {
//   SplashCubit(this._loginBloc) : super(null);

//   final LoginBloc _loginBloc;

//   Future<void> init(BuildContext context) async {
//     await Future.delayed(const Duration(seconds: 2), () async {
//       // Open Login page or Onboarding Screen

//       if (context.mounted) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => BlocProvider.value(
//               value: _loginBloc,
//               child: const OnboardingView(),
//             ),
//           ),
//         );
//       }
//     });
//   }
// }