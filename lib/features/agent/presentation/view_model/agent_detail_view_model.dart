import 'package:flutter/material.dart';
import 'package:nest_finder/features/agent/data/model/agent_model.dart';

class AgentDetailViewModel extends ChangeNotifier {
  final Agent agent;

  AgentDetailViewModel({required this.agent});

  String get name => agent.name;
  String get imageUrl => agent.imageUrl;
  String get description => agent.description;
  String get phone => agent.phone;
  String get email => agent.email;

  void openSocialMedia(String platform) {
    // Placeholder for handling social media navigation
    debugPrint('Opening $platform for ${agent.name}');
  }
}
