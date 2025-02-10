import 'package:flutter/material.dart';
import 'package:nest_finder/features/contact/view_model/contactpage_view_model.dart';
import 'package:provider/provider.dart';

class ContactPageView extends StatelessWidget {
  const ContactPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ContactViewModel>(context);
    final isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: Colors.blueAccent,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isTablet ? 32.0 : 16.0,
            vertical: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Get in Touch',
                style: TextStyle(
                  fontSize: isTablet ? 28 : 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Have questions or need assistance? Feel free to reach out!',
                style: TextStyle(fontSize: isTablet ? 18 : 16),
              ),
              const SizedBox(height: 20),

              // Contact Form
              TextField(
                controller: viewModel.nameController,
                decoration: const InputDecoration(
                  labelText: 'Your Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: viewModel.emailController,
                decoration: const InputDecoration(
                  labelText: 'Your Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: viewModel.messageController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.message),
                ),
              ),
              const SizedBox(height: 20),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: viewModel.isSubmitting
                      ? null
                      : () => viewModel.submitForm(context),
                  icon: viewModel.isSubmitting
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Icon(Icons.send),
                  label: Text(
                    viewModel.isSubmitting ? 'Sending...' : 'Send Message',
                    style: TextStyle(fontSize: isTablet ? 20 : 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              const Divider(),

              // Contact Info
              const SizedBox(height: 10),
              Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: isTablet ? 22 : 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const ListTile(
                leading: Icon(Icons.email, color: Colors.red),
                title: Text('Email'),
                subtitle: Text('support@homefinder.com'),
              ),
              const ListTile(
                leading: Icon(Icons.phone, color: Colors.blue),
                title: Text('Phone'),
                subtitle: Text('+1 234 567 890'),
              ),
              const ListTile(
                leading: Icon(Icons.location_on, color: Colors.orange),
                title: Text('Address'),
                subtitle: Text('123 Real Estate Street, NY, USA'),
              ),

              const Divider(),
              const SizedBox(height: 10),

              // Social Media
              Text(
                'Follow Us',
                style: TextStyle(
                  fontSize: isTablet ? 22 : 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 16,
                children: [
                  IconButton(
                    icon: const Icon(Icons.facebook, color: Colors.blue),
                    iconSize: isTablet ? 40 : 30,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.camera_alt, color: Colors.purple),
                    iconSize: isTablet ? 40 : 30,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.video_collection, color: Colors.red),
                    iconSize: isTablet ? 40 : 30,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
