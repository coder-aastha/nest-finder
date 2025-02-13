import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/my_header_drawer_view_model.dart';

class MyHeaderDrawerView extends StatelessWidget {
  const MyHeaderDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyHeaderDrawerViewModel(),
      child: Consumer<MyHeaderDrawerViewModel>(
        builder: (context, viewModel, _) {
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
                  onTap: () => viewModel.showImagePicker(context), // Open image picker
                  child: Container(
                    margin: EdgeInsets.only(bottom: isTablet ? 15 : 10),
                    height: isTablet ? 90 : 70,
                    width: isTablet ? 90 : 70,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: viewModel.image != null
                        ? ClipOval(
                            child: Image.file(
                              viewModel.image!,
                              fit: BoxFit.cover,
                              width: isTablet ? 90 : 70,
                              height: isTablet ? 90 : 70,
                            ),
                          )
                        : const CircleAvatar(
                            backgroundImage: AssetImage("assets/images/homepage_image.png"),
                            radius: 40,
                          ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
