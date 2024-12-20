import 'package:flutter/material.dart';
import 'package:nest_finder/view/aboutpage_view.dart';
import 'package:nest_finder/view/agentpage_view.dart';
import 'package:nest_finder/view/contactpage_view.dart';
import 'package:nest_finder/view/homepage_view.dart';
import 'package:nest_finder/view/my_header_drawer_view.dart'; // Assuming this import is correct

class DrawerHomepageView extends StatefulWidget {
  const DrawerHomepageView({super.key});

  @override
  State<DrawerHomepageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<DrawerHomepageView> {
  // The variable to hold the current page (selected drawer item)
  DrawerSection currentPage = DrawerSection.home;

  @override
  Widget build(BuildContext context) {
    // Assign the appropriate widget based on the currentPage value
    Widget container = _getPageForCurrentSection();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nest Finder"),
        // Use Builder to get the right context for Scaffold.of(context)
        // leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: const Icon(Icons.menu),
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer(); // Opens the drawer
        //       },
        //     );
        //   },
        // ),
      ),
      body: container, // This will display the widget based on currentPage
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyHeaderDrawerView(),
              myDrawerListView(), // Drawer list view
            ],
          ),
        ),
      ),
    );
  }

  // Method to get the appropriate widget based on the currentPage value
  Widget _getPageForCurrentSection() {
    switch (currentPage) {
      case DrawerSection.home:
        return const HomepageView(); // Show homepage when home is selected
      case DrawerSection.about:
        return const AboutpageView(); // Show about page when about is selected
      case DrawerSection.contact:
        return const ContactPageView(); // Show contact page when contact is selected
      case DrawerSection.agents:
        return const AgentPageView(); // Show agent page when agents is selected
    }
  }

  // The DrawerListView that contains the list of items in the Drawer
  Widget myDrawerListView() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          // Passing correct parameters for each menu item
          menuItem(
            1,
            "Home",
            Icons.home_max_outlined,
            currentPage == DrawerSection.home, // Check if it's the selected page
          ),
          menuItem(
            2,
            "About",
            Icons.info_outline,
            currentPage == DrawerSection.about, // Check if it's the selected page
          ),
          menuItem(
            3,
            "Contact",
            Icons.contact_mail_outlined,
            currentPage == DrawerSection.contact, // Check if it's the selected page
          ),
          menuItem(
            4,
            "Agent",
            Icons.account_box_outlined,
            currentPage == DrawerSection.agents, // Check if it's the selected page
          ),
        ],
      ),
    );
  }

  // Menu item widget now takes parameters like text, icon, and whether it is active
  Widget menuItem(int id, String title, IconData icon, bool isActive) {
    return Material(
      color: isActive
          ? Colors.blue[100]
          : Colors.transparent, // Highlight active item
      child: InkWell(
        onTap: () {
          setState(() {
            // Update the current page when an item is tapped
            currentPage = DrawerSection.values[id - 1]; // Using the correct enum value
          });
          Navigator.pop(context); // Close the drawer after selection
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Icon(icon, size: 20, color: Colors.black),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Enum to represent the different sections in the drawer
enum DrawerSection {
  home,
  about,
  contact,
  agents,
}
