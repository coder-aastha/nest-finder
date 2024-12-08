import 'package:flutter/material.dart';

class MyHeaderDrawerView extends StatefulWidget {
  const MyHeaderDrawerView({super.key});

  @override
  State<MyHeaderDrawerView> createState() => _MyHeaderDrawerViewState();
}

class _MyHeaderDrawerViewState extends State<MyHeaderDrawerView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 212, 164, 20),
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin:  const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/images/homepage_image.png"),
              ),
            ),
          ),
          const Text(
            "aastha2@gmail.com",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
