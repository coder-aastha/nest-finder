import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // primarySwatch: Colors.purple,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Montserrat Regular",
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: "Montserrat Bold"),
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
    // Change text field theme
    // inputDecorationTheme: const InputDecorationTheme(
    //   contentPadding: EdgeInsets.all(15),
    //   border: OutlineInputBorder(),
    //   labelStyle: TextStyle(
    //     fontSize: 20,
    //   ),
    //   errorBorder: OutlineInputBorder(
    //     borderSide: BorderSide(
    //       color: Colors.red,
    //     ),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderSide: BorderSide(color: Color(0x000ff000)),
    //   ),
    // ),
  );
}
