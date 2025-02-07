import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nest_finder/features/auth/presentation/view/signup_page_view.dart';
import 'package:nest_finder/features/auth/presentation/view_model/login/login_bloc.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginPageView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: 'aastha');
  final _passwordController = TextEditingController(text: '111111');
  bool _isPasswordVisible = false;

  final _gap = const SizedBox(height: 25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Logo Section
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                color: Colors.white,
                child: Image.asset(
                  'assets/images/login_image.png',
                  fit: BoxFit.contain,
                ),
              ),
              // Login Form Section
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const Text(
                              'Log In',
                              key: Key('logInTitle'),
                              style: TextStyle(
                                fontFamily: 'Junge',
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 40),
                            // Username Field
                            TextFormField(
                              key: const ValueKey('username'),
                              controller: _usernameController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                labelText: 'Username',
                                hintText: 'aastha',
                                hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 162, 158, 158),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter username';
                                }
                                return null;
                              },
                            ),
                            _gap,
                            // Password Field
                            TextFormField(
                              key: const ValueKey('password'),
                              controller: _passwordController,
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                labelText: 'Password',
                                hintText: '********',
                                hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 162, 158, 158),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            // Forgot Password
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  // Add Forgot Password Navigation
                                },
                                child: const Text(
                                  "Forgot password?",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            _gap,
                            // Login Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // Proceed with login if validation succeeds
                                    context.read<LoginBloc>().add(
                                          LoginUserEvent(
                                            context: context,
                                            username: _usernameController.text,
                                            password: _passwordController.text,
                                          ),
                                        );
                                  }
                                },
                                child: const Text(
                                  'Log In',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Divider and Signup Link
              Container(
                height: 1,
                color: Colors.grey.shade400,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    key: const ValueKey('registerButton'),
                    onPressed: () {
                      context.read<LoginBloc>().add(
                            NavigateRegisterScreenEvent(
                              destination: const SignupPageView(),
                              context: context,
                            ),
                          );
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}