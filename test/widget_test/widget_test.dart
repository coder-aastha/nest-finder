import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nest_finder/features/auth/presentation/view/login_page_view.dart';
import 'package:nest_finder/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:nest_finder/features/home/presentation/view/home/homepage_view.dart';

// Mock the LoginBloc class if necessary to test event dispatching
class MockLoginBloc implements LoginBloc {
  @override
  void add(LoginEvent event) {}

  @override
  void addError(Object error, [StackTrace? stackTrace]) {}

  @override
  Future<void> close() {
    throw UnimplementedError();
  }

  @override
  void emit(LoginState state) {}

  @override
  bool get isClosed => throw UnimplementedError();

  @override
  void on<E extends LoginEvent>(EventHandler<E, LoginState> handler,
      {EventTransformer<E>? transformer}) {
  }

  @override
  void onChange(Change<LoginState> change) {
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
  }

  @override
  void onEvent(LoginEvent event) {
  }

  @override
  void onTransition(Transition<LoginEvent, LoginState> transition) {
  }

  @override
  LoginState get state => throw UnimplementedError();

  @override
  Stream<LoginState> get stream => throw UnimplementedError();
}

void main() {
  testWidgets('should display username input field and allow text input',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPageView()));

    // Find the username field
    final usernameField = find.byKey(const ValueKey('username'));

    // Check if the username field is present
    expect(usernameField, findsOneWidget);

    // Enter text into the username field
    await tester.enterText(usernameField, 'testuser');
    expect(find.text('testuser'), findsOneWidget);
  });

  testWidgets('should display password input field and allow text input',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPageView()));

    // Find the password field
    final passwordField = find.byKey(const ValueKey('password'));

    // Check if the password field is present
    expect(passwordField, findsOneWidget);

    // Enter text into the password field
    await tester.enterText(passwordField, 'mypassword');
    expect(find.text('mypassword'), findsOneWidget);
  });

  testWidgets('should toggle password visibility on icon press',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPageView()));

    // Find the password visibility icon (initially off)
    final visibilityIcon = find.byIcon(Icons.visibility_off);

    // Ensure that the password is initially obscured
    expect(visibilityIcon, findsOneWidget);

    // Tap the visibility icon to show the password
    await tester.tap(visibilityIcon);
    await tester.pump();

    // Ensure the visibility icon changes to "visibility"
    expect(find.byIcon(Icons.visibility), findsOneWidget);

    // Tap the visibility icon again to obscure the password
    await tester.tap(find.byIcon(Icons.visibility));
    await tester.pump();

    // Ensure the visibility icon changes back to "visibility_off"
    expect(find.byIcon(Icons.visibility_off), findsOneWidget);
  });

  testWidgets('should display login button and allow tapping',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPageView()));

    // Find the login button
    final loginButton = find.byKey(const ValueKey('loginButton'));

    // Check if the login button is present
    expect(loginButton, findsOneWidget);

    // Tap the login button
    await tester.tap(loginButton);
    await tester.pump();

    // Add further assertions based on expected behavior after tapping
  });

  testWidgets('should show error message if username is empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPageView()));

    final loginButton = find.byKey(const ValueKey('loginButton'));
    await tester.tap(loginButton);
    await tester.pump();

    // Expect an error message to be displayed
    expect(find.text('Username cannot be empty'), findsOneWidget);
  });

  testWidgets('should show error message if password is empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPageView()));

    await tester.enterText(find.byKey(const ValueKey('username')), 'testuser');
    final loginButton = find.byKey(const ValueKey('loginButton'));
    await tester.tap(loginButton);
    await tester.pump();

    // Expect an error message to be displayed
    expect(find.text('Password cannot be empty'), findsOneWidget);
  });

  testWidgets('should disable login button when username or password is empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPageView()));

    final loginButton = find.byKey(const ValueKey('loginButton'));

    // Expect the login button to be disabled initially
    expect(tester.widget<ElevatedButton>(loginButton).enabled, false);

    await tester.enterText(find.byKey(const ValueKey('username')), 'testuser');
    await tester.pump();

    // Login button should still be disabled since password is empty
    expect(tester.widget<ElevatedButton>(loginButton).enabled, false);
  });

  testWidgets(
      'should enable login button when both username and password are entered',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPageView()));

    final loginButton = find.byKey(const ValueKey('loginButton'));

    await tester.enterText(find.byKey(const ValueKey('username')), 'testuser');
    await tester.enterText(
        find.byKey(const ValueKey('password')), 'mypassword');
    await tester.pump();

    // Login button should now be enabled
    expect(tester.widget<ElevatedButton>(loginButton).enabled, true);
  });

  testWidgets('should navigate to home page on successful login',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPageView()));

    await tester.enterText(find.byKey(const ValueKey('username')), 'validuser');
    await tester.enterText(
        find.byKey(const ValueKey('password')), 'validpassword');
    await tester.tap(find.byKey(const ValueKey('loginButton')));
    await tester.pumpAndSettle();

    // Expect navigation to home page
    expect(find.byType(const HomepageView().runtimeType), findsOneWidget);
  });

  testWidgets('should show loading indicator while logging in',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPageView()));

    await tester.enterText(find.byKey(const ValueKey('username')), 'testuser');
    await tester.enterText(
        find.byKey(const ValueKey('password')), 'mypassword');
    await tester.tap(find.byKey(const ValueKey('loginButton')));
    await tester.pump();

    // Expect a loading indicator to be present
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('should show error message on login failure',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPageView()));

    await tester.enterText(find.byKey(const ValueKey('username')), 'wronguser');
    await tester.enterText(
        find.byKey(const ValueKey('password')), 'wrongpassword');
    await tester.tap(find.byKey(const ValueKey('loginButton')));
    await tester.pumpAndSettle();

    // Expect error message to be displayed
    expect(find.text('Invalid username or password'), findsOneWidget);
  });
}
