import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nest_finder/features/profile/presentation/view_model/profile_view_model.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProfileViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: viewModel.user == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Text(viewModel.user!.name, style: const TextStyle(fontSize: 24)),
                ElevatedButton(
                  onPressed: () => _showEditNameDialog(context, viewModel),
                  child: const Text('Edit Name'),
                ),
              ],
            ),
    );
  }

  void _showEditNameDialog(BuildContext context, ProfileViewModel viewModel) {
    String newName = viewModel.user!.name;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Name'),
          content: TextField(
            onChanged: (value) => newName = value,
            decoration: const InputDecoration(hintText: 'Enter new name'),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(
              onPressed: () {
                viewModel.updateProfileName(newName);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
