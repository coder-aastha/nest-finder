import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:nest_finder/features/auth/presentation/view_model/signup/register_bloc.dart';

class MyHeaderDrawerView extends StatefulWidget {
  const MyHeaderDrawerView({super.key});

  @override
  State<MyHeaderDrawerView> createState() => _MyHeaderDrawerViewState();
}

class _MyHeaderDrawerViewState extends State<MyHeaderDrawerView> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Check for storage and camera permission
  Future<void> checkPermissions() async {
    await [
      Permission.camera,
      Permission.photos,
      Permission.storage,
    ].request();
  }

  // Pick an image from camera or gallery
  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });

        // Send image to RegisterBloc for upload
        context.read<RegisterBloc>().add(UploadImage(file: _image!));
      }
    } catch (e) {
      debugPrint("Image picking error: $e");
    }
  }

  // Show options to pick image from camera or gallery
  void _showImagePicker() {
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
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a Picture'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 768;

    return Container(
      color: const Color.fromARGB(255, 212, 164, 20),
      width: double.infinity,
      height: isTablet ? 250 : 200,
      padding: EdgeInsets.only(top: isTablet ? 30.0 : 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _showImagePicker, // Open image picker on tap
            child: Container(
              margin: EdgeInsets.only(bottom: isTablet ? 15 : 10),
              height: isTablet ? 90 : 70,
              width: isTablet ? 90 : 70,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: _image != null
                  ? ClipOval(
                      child: Image.file(
                        _image!,
                        fit: BoxFit.cover,
                        width: isTablet ? 90 : 70,
                        height: isTablet ? 90 : 70,
                      ),
                    )
                  : const CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/homepage_image.png"),
                      radius: 40,
                    ),
            ),
          ),
          // Text(
          //   "aastha2@gmail.com",
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontSize: isTablet ? 16 : 14,
          //     fontWeight: isTablet ? FontWeight.w500 : FontWeight.normal,
          //   ),
          // ),
        ],
      ),
    );
  }
}
