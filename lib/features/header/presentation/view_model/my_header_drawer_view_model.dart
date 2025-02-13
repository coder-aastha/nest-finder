import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class MyHeaderDrawerViewModel extends ChangeNotifier {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  File? get image => _image;

  MyHeaderDrawerViewModel() {
    _checkPermissions();
  }

  /// Check for storage and camera permissions
  Future<void> _checkPermissions() async {
    await [
      Permission.camera,
      Permission.photos,
      Permission.storage,
    ].request();
  }

  /// Pick an image from the given source
  Future<void> _pickImage(ImageSource source, BuildContext context) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        notifyListeners();

        // Handle image upload logic if needed (e.g., calling an upload service)
        // Example: await _uploadImage(_image!);
      }
    } catch (e) {
      debugPrint("Image picking error: $e");
      _showSnackBar(context, "Failed to pick image.");
    }
  }

  /// Show options to pick an image from camera or gallery
  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery, context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a Picture'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera, context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// Optional: Show a snack bar for feedback
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
