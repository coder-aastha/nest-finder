import 'package:flutter/material.dart';

class ContactViewModel extends ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  bool isSubmitting = false;

  void submitForm(BuildContext context) {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        messageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields')),
      );
      return;
    }

    isSubmitting = true;
    notifyListeners();

    // Simulate a network request
    Future.delayed(const Duration(seconds: 2), () {
      isSubmitting = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message sent successfully!')),
      );

      clearFields();
    });
  }

  void clearFields() {
    nameController.clear();
    emailController.clear();
    messageController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }
}
