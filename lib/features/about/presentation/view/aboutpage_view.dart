import 'package:flutter/material.dart';
import 'package:nest_finder/features/about/presentation/view_model/about_view_model.dart';
import 'package:provider/provider.dart';

class AboutPageView extends StatelessWidget {
  const AboutPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AboutViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Colors.blueAccent,
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
                Text(
                  viewModel.appTitle,
                  style: TextStyle(
                    fontSize: isTablet ? 28 : 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  viewModel.appDescription,
                  style: TextStyle(fontSize: isTablet ? 18 : 16, color: Colors.grey[700]),
                ),
                const SizedBox(height: 20),
                const Divider(color: Colors.grey, thickness: 1),
                const SizedBox(height: 10),
                _buildSectionTitle('Our Mission', isTablet),
                _buildSectionContent(viewModel.mission, isTablet),
                const SizedBox(height: 10),
                _buildSectionTitle('Our Vision', isTablet),
                _buildSectionContent(viewModel.vision, isTablet),
                const Divider(color: Colors.grey, thickness: 1),
                const SizedBox(height: 10),
                _buildSectionTitle('Contact Us', isTablet),
                ...viewModel.contactInfo.entries.map(
                  (entry) => _buildContactInfo(entry.key, entry.value['icon'], entry.value['value'], isTablet),
                ),
                const Divider(color: Colors.grey, thickness: 1),
                const SizedBox(height: 10),
                _buildSectionTitle('Follow Us', isTablet),
                const SizedBox(height: 8),
                _buildSocialMediaButtons(viewModel, isTablet),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isTablet) {
    return Text(
      title,
      style: TextStyle(
        fontSize: isTablet ? 22 : 18,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  Widget _buildSectionContent(String content, bool isTablet) {
    return Text(
      content,
      style: TextStyle(fontSize: isTablet ? 18 : 14, color: Colors.grey[700]),
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

  Widget _buildSocialMediaButtons(AboutViewModel viewModel, bool isTablet) {
    return Wrap(
      spacing: 16,
      children: viewModel.socialMediaLinks.map((link) {
        return IconButton(
          icon: Icon(link['icon'], color: link['color']),
          iconSize: isTablet ? 40 : 30,
          onPressed: link['onTap'],
        );
      }).toList(),
    );
  }
}
