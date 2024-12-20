import 'package:flutter/material.dart';

class MyHeaderDrawerView extends StatefulWidget {
  const MyHeaderDrawerView({super.key});

  @override
  State<MyHeaderDrawerView> createState() => _MyHeaderDrawerViewState();
}

class _MyHeaderDrawerViewState extends State<MyHeaderDrawerView> {
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
          Container(
            margin: EdgeInsets.only(bottom: isTablet ? 15 : 10),
            height: isTablet ? 90 : 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/images/homepage_image.png"),
              ),
            ),
          ),
          Text(
            "aastha2@gmail.com",
            style: TextStyle(
              color: Colors.white,
              fontSize: isTablet ? 16 : 14,
              fontWeight: isTablet ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}