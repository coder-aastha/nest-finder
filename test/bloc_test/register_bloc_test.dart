// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:nest_finder/core/error/failure.dart';
// import 'package:nest_finder/features/auth/domain/use_case/register_usecase.dart';
// import 'package:nest_finder/features/auth/presentation/view_model/signup/register_bloc.dart';

// class MockRegisterUseCase extends Mock implements RegisterUseCase {}

// void main() {
//   late MockRegisterUseCase mockRegisterUseCase;
//   late RegisterBloc registerBloc;
//   final mockContext = MockBuildContext();

//   setUp(() {
//     mockRegisterUseCase = MockRegisterUseCase();
//     registerBloc = RegisterBloc(registerUseCase: mockRegisterUseCase);
//     registerFallbackValue(const RegisterUserParams(
//       email: "test@example.com",
//       username: "testuser",
//       password: "password123",
//     ));
//   });

//   tearDown(() {
//     registerBloc.close();
//   });

//   group('RegisterBloc', () {
//     const testEmail = "test@example.com";
//     const testUsername = "testuser";
//     const testPassword = "password123";

//     // test('initial state should be RegisterState.initial()', () {
//     //   expect(registerBloc.state, const RegisterState.initial());
//     // });

//     blocTest<RegisterBloc, RegisterState>(
//       'emits [loading, failure] when registration fails',
//       build: () {
//         when(() => mockRegisterUseCase(any())).thenAnswer(
//             (_) async => const Left(ApiFailure(message: 'Invalid')));
//         return registerBloc;
//       },
//       act: (bloc) => bloc.add(
//         RegisterUser(
//           context: mockContext,
//           email: testEmail,
//           username: testUsername,
//           password: testPassword,
//           confirmPassword: '',
//         ),
//       ),
//       expect: () => [
//         const RegisterState(isLoading: true, isSuccess: false),
//         const RegisterState(isLoading: false, isSuccess: false),
//       ],
//       verify: (_) {
//         verify(() => mockRegisterUseCase(any())).called(1);
//       },
//     );
//   });
// }

// class MockBuildContext extends Mock implements BuildContext {}
