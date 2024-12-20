import 'package:flutter/material.dart';
import 'login_page_view.dart';

class SignUpPageView extends StatefulWidget {
  const SignUpPageView({super.key});

  @override
  SignUpPageViewState createState() => SignUpPageViewState();
}

class SignUpPageViewState extends State<SignUpPageView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  // Global variables to store the email and password
  static String? registeredEmail;
  static String? registeredPassword;

  // Method to adjust font size based on screen width
  double getFontSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 600) {
      // iPad or larger tablets (Landscape or iPad-like devices)
      return 30.0;
    } else {
      // Mobile devices
      return 24.0;
    }
  }

  // Method to get the SizedBox height based on the screen width
  double getSizedBoxHeight(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 600) {
      // For iPad or larger tablets
      return 80.0;
    } else {
      // For mobile devices
      return 50.0;
    }
  }

  // Method to adjust font size for "Already have an account?" text
  double getAccountFontSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 600) {
      // Larger font size for tablets
      return 20.0;
    } else {
      // Smaller font size for mobile
      return 16.0;
    }
  }

  // Method to adjust the space between the confirm password field and sign up button
  double getSignUpSpacing(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 600) {
      // For iPad or larger tablets
      return 54.0;
    } else {
      // For mobile devices
      return 24.0;
    }
  }

  // Method to adjust the space between the "Please register your account" and email input
  double getRegisterSpacing(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 600) {
      // Larger spacing for tablets
      return 30.0;
    } else {
      // Smaller spacing for mobile devices
      return 16.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = getFontSize(context); // Get the appropriate font size for the screen
    double sizedBoxHeight = getSizedBoxHeight(context); // Get the appropriate height for the SizedBox
    double accountFontSize = getAccountFontSize(context); // Font size for the "Already have an account?" text
    double signUpSpacing = getSignUpSpacing(context); // Space between confirm password and sign-up button
    double registerSpacing = getRegisterSpacing(context); // Space between text and email input

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Vertically center the content
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Horizontally center the content
                children: [
                  // Full-width and non-cut image at the top
                  Container(
                    width:
                        MediaQuery.of(context).size.width, // Full-width image
                    height: MediaQuery.of(context).size.height *
                        0.3, // Adjust the height for the image (30% of screen height)
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/signup_image.png'), // Ensure this image exists in your assets
                        fit: BoxFit
                            .cover, // Ensure the image covers the container without being cut
                      ),
                    ),
                  ),
                  SizedBox(
                      height:
                          sizedBoxHeight), // Dynamic space between image and text

                  // Title and description
                  Text(
                    'Sign Up Here',
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Please register your account',
                    style:
                        TextStyle(fontSize: fontSize - 10, color: Colors.grey),
                  ),
                  SizedBox(height: registerSpacing), // Dynamic space between the "Please register" text and email input

                  // Email Field
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  const SizedBox(height: 16),

                  // Password Field
                  TextField(
                    controller: passwordController,
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Confirm Password Field
                  TextField(
                    controller: confirmPasswordController,
                    obscureText: !isConfirmPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isConfirmPasswordVisible =
                                !isConfirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: signUpSpacing), // Adjusted space between confirm password and sign-up button

                  // Full-width Sign Up Button
                  SizedBox(
                    width: double.infinity, // Make the button full-width
                    child: ElevatedButton(
                      onPressed: () {
                        if (passwordController.text ==
                            confirmPasswordController.text) {
                          // Store the email and password in memory
                          setState(() {
                            registeredEmail = emailController.text;
                            registeredPassword = passwordController.text;
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Registered successfully!')),
                          );

                          // Navigate back to LoginPageView
                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPageView(),
                              ),
                            );
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Passwords do not match!')),
                          );
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Already have an account? Sign In
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(fontSize: accountFontSize),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPageView(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(fontSize: accountFontSize),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
