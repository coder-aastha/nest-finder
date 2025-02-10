import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/agent_view_model.dart';
import 'agent_detail_page.dart';

class AgentPageView extends StatelessWidget {
  const AgentPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final agentViewModel = Provider.of<AgentViewModel>(context);
    final agents = agentViewModel.agents;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Agents'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth > 600;

          return ListView.builder(
            itemCount: agents.length,
            itemBuilder: (context, index) {
              final agent = agents[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(agent.imageUrl),
                  radius: isTablet ? 40 : 30,
                ),
                title: Text(
                  agent.name,
                  style: TextStyle(
                    fontSize: isTablet ? 20 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  agent.description,
                  style: TextStyle(
                    fontSize: isTablet ? 16 : 14,
                    color: Colors.grey[700],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AgentDetailPage(agent: agent),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
