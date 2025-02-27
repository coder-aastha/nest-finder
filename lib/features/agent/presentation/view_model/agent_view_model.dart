import 'package:flutter/material.dart';
import 'package:nest_finder/features/agent/data/model/agent_model.dart';

class AgentViewModel extends ChangeNotifier {
  List<Agent> _agents = [];

  List<Agent> get agents => _agents;

  AgentViewModel() {
    fetchAgents();
  }

  void fetchAgents() {
    _agents = [
      Agent(
        id: 1,
        name: 'John Doe',
        imageUrl: 'https://via.placeholder.com/150',
        description: 'Experienced real estate agent with over 10 years of experience.',
        phone: '+1 234 567 890',
        email: 'john.doe@example.com',
      ),
      Agent(
        id: 2,
        name: 'Jane Smith',
        imageUrl: 'https://via.placeholder.com/150',
        description: 'Specializes in luxury properties and high-end real estate.',
        phone: '+1 345 678 901',
        email: 'jane.smith@example.com',
      ),
      // Add more agents as needed
    ];
    notifyListeners();
  }
}
