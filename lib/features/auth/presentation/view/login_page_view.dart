import 'package:flutter/material.dart';
import 'package:nest_finder/features/splash/presentation/view/homepage_view.dart';
import 'package:nest_finder/features/auth/presentation/view/signup_page_view.dart'; // Import SignUpPageView to check stored credentials

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  LoginPageViewState createState() => LoginPageViewState();
}

class LoginPageViewState extends State<LoginPageView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _errorMessage;
  bool _isPasswordVisible = false; // To toggle password visibility

  // Method to adjust font size based on screen width
  double getFontSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 600) {
      // iPad or larger tablets (Landscape or iPad-like devices)
      return 29.0;
    } else {
      // Mobile devices
      return 24.0;
    }
  }

  // Method to adjust the SizedBox height between the image and "Welcome Back!"
  double getSpacingHeight(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 600) {
      // iPad or larger tablets
      return 50.0;
    } else {
      // Mobile devices
      return 25.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    double fontSize =
        getFontSize(context); // Get the appropriate font size for the screen
    double spacingHeight =
        getSpacingHeight(context); // Get the appropriate spacing height

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, bottom: 16.0, top: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Full-width and larger image at the top
                Container(
                  width: MediaQuery.of(context)
                      .size
                      .width, // Make the image full width
                  height: MediaQuery.of(context).size.height *
                      0.4, // Adjust height to be proportional to the screen height (40% of the screen height)
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/login_image.png'), // Ensure this image exists in your assets
                      fit: BoxFit.cover, // Ensure the image covers the container
                    ),
                  ),
                ),
                SizedBox(
                    height:
                        spacingHeight), // Use dynamic spacing here based on device type
        
                // Welcome text
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Please login to your account',
                  style: TextStyle(fontSize: fontSize - 10, color: Colors.grey),
                ),
                const SizedBox(height: 60),
        
                // Form for email and password
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email Field
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: const Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          }
                          if (!RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA0-9.-]+\.[a-zA-Z]{2,}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
        
                      // Password Field with visibility toggle
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
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
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
        
                      // Show error message if there's any
                      if (_errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            _errorMessage!,
                            style:
                                const TextStyle(color: Colors.red, fontSize: 14),
                          ),
                        ),
        
                      // Login Button
                      ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: fontSize - 6, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
        
                      // Don't have an account? Sign Up text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(fontSize: fontSize - 8),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigate to Sign Up Page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPageView()),
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSize - 8),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      // Check if the email and password match the registered credentials
      if (email == SignUpPageViewState.registeredEmail &&
          password == SignUpPageViewState.registeredPassword) {
        // Simulate successful login
        print('Login successful');
        _errorMessage = null; // Clear previous errors

        // Navigate to the HomePageView after successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomepageView()),
        );
      } else {
        setState(() {
          _errorMessage = 'Invalid email or password. Please try again.';
        });
      }
    }
  }
}
