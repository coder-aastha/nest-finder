import 'package:flutter/material.dart';

class AboutViewModel extends ChangeNotifier {
  // App Information
  final String appTitle = "Welcome to Nest Finder";
  final String appDescription = "Nest Finder is your trusted real estate marketplace, "
      "helping you find your dream home with ease. Our platform "
      "connects buyers, sellers, and agents seamlessly.";

  // Mission & Vision
  final String mission = "To simplify property buying and selling through technology.";
  final String vision = "To be the leading digital real estate marketplace worldwide.";

  // Contact Information
  final Map<String, dynamic> contactInfo = {
    "Email": {"icon": Icons.email, "value": "support@nestfinder.com"},
    "Phone": {"icon": Icons.phone, "value": "+1 234 567 890"},
    "Address": {"icon": Icons.location_on, "value": "123 Real Estate Street, NY, USA"},
  };

  // Social Media Links
  final List<Map<String, dynamic>> socialMediaLinks = [
    {"platform": "Facebook", "icon": Icons.facebook, "color": Colors.blue, "onTap": () => debugPrint("Facebook clicked")},
    {"platform": "Instagram", "icon": Icons.camera_alt, "color": Colors.purple, "onTap": () => debugPrint("Instagram clicked")},
    {"platform": "YouTube", "icon": Icons.video_collection, "color": Colors.red, "onTap": () => debugPrint("YouTube clicked")},
  ];
}
