// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:nest_finder/features/auth/presentation/view/login_page_view.dart';
// import 'package:nest_finder/features/auth/presentation/view_model/login/login_bloc.dart';

// // Mock the LoginBloc class if necessary to test event dispatching
// class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
//     implements LoginBloc {}

// void main() {
//   testWidgets('should display username input field and allow text input',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(const MaterialApp(home: LoginPageView()));

//     // Find the username field
//     final usernameField = find.byKey(const ValueKey('username'));

//     // Check if the username field is present
//     expect(usernameField, findsOneWidget);

//     // Enter text into the username field
//     await tester.enterText(usernameField, 'testuser');
//     expect(find.text('testuser'), findsOneWidget);
//   });

//   testWidgets('should display password input field and allow text input',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(const MaterialApp(home: LoginPageView()));

//     // Find the password field
//     final passwordField = find.byKey(const ValueKey('password'));

//     // Check if the password field is present
//     expect(passwordField, findsOneWidget);

//     // Enter text into the password field
//     await tester.enterText(passwordField, 'mypassword');
//     expect(find.text('mypassword'), findsOneWidget);
//   });

//   testWidgets('should toggle password visibility on icon press',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(const MaterialApp(home: LoginPageView()));

//     // Find the password visibility icon (initially off)
//     final visibilityIcon = find.byIcon(Icons.visibility_off);

//     // Ensure that the password is initially obscured
//     expect(visibilityIcon, findsOneWidget);

//     // Tap the visibility icon to show the password
//     await tester.tap(visibilityIcon);
//     await tester.pump();

//     // Ensure the visibility icon changes to "visibility"
//     expect(find.byIcon(Icons.visibility), findsOneWidget);

//     // Tap the visibility icon again to obscure the password
//     await tester.tap(find.byIcon(Icons.visibility));
//     await tester.pump();

//     // Ensure the visibility icon changes back to "visibility_off"
//     expect(find.byIcon(Icons.visibility_off), findsOneWidget);
//   });
// }
