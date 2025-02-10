import 'package:flutter/material.dart';
import 'package:nest_finder/features/agent/data/models/agent_model.dart';
import 'package:provider/provider.dart';
import '../view_model/agent_detail_view_model.dart';

class AgentDetailPage extends StatelessWidget {
  final Agent agent;

  const AgentDetailPage({super.key, required this.agent});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AgentDetailViewModel(agent: agent),
      child: Consumer<AgentDetailViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(viewModel.name),
              backgroundColor: Colors.blueAccent,
              elevation: 0,
              centerTitle: true,
            ),
            body: LayoutBuilder(
              builder: (context, constraints) {
                bool isTablet = constraints.maxWidth > 600;

                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: isTablet ? 32.0 : 16.0,
                    vertical: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(viewModel.imageUrl),
                        radius: isTablet ? 80 : 60,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        viewModel.name,
                        style: TextStyle(
                          fontSize: isTablet ? 32 : 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        viewModel.description,
                        style: TextStyle(
                          fontSize: isTablet ? 20 : 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(color: Colors.grey, thickness: 1),
                      const SizedBox(height: 20),
                      _buildContactInfo('Phone', Icons.phone, viewModel.phone, isTablet),
                      _buildContactInfo('Email', Icons.email, viewModel.email, isTablet),
                      const SizedBox(height: 20),
                      const Divider(color: Colors.grey, thickness: 1),
                      const SizedBox(height: 20),
                      _buildSocialMediaSection(context, viewModel, isTablet),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildContactInfo(String title, IconData icon, String subtitle, bool isTablet) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue, size: isTablet ? 36 : 24),
      title: Text(
        title,
        style: TextStyle(fontSize: isTablet ? 20 : 16, color: Colors.blue),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: isTablet ? 18 : 14, color: Colors.grey[700]),
      ),
    );
  }

  Widget _buildSocialMediaSection(BuildContext context, AgentDetailViewModel viewModel, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Follow Us',
          style: TextStyle(
            fontSize: isTablet ? 22 : 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 16,
          children: [
            IconButton(
              icon: const Icon(Icons.facebook, color: Colors.blue),
              iconSize: isTablet ? 40 : 30,
              onPressed: () => viewModel.openSocialMedia('Facebook'),
            ),
            IconButton(
              icon: const Icon(Icons.camera_alt, color: Colors.purple),
              iconSize: isTablet ? 40 : 30,
              onPressed: () => viewModel.openSocialMedia('Instagram'),
            ),
            IconButton(
              icon: const Icon(Icons.video_collection, color: Colors.red),
              iconSize: isTablet ? 40 : 30,
              onPressed: () => viewModel.openSocialMedia('YouTube'),
            ),
          ],
        ),
      ],
    );
  }
}
