import 'package:flutter/material.dart';
import 'package:nest_finder/view/aboutpage_view.dart';
import 'package:nest_finder/view/agentpage_view.dart';
import 'package:nest_finder/view/contactpage_view.dart';
import 'package:nest_finder/view/homepage_view.dart';
import 'package:nest_finder/view/my_header_drawer_view.dart';

class DrawerHomePageView extends StatefulWidget {
  const DrawerHomePageView({super.key});

  @override
  State<DrawerHomePageView> createState() => _DrawerHomePageViewState();
}

class _DrawerHomePageViewState extends State<DrawerHomePageView> {
  // The variable to hold the current page (selected drawer item)
  DrawerSection currentPage = DrawerSection.home;

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Decide container width based on screen size
    double containerWidth = screenWidth > 600 ? 600 : screenWidth;

    // The body widget (currentPage) that gets updated when a drawer item is tapped
    StatelessWidget container = const HomepageView(); // Default value
    if (currentPage == DrawerSection.home) {
      container = const HomepageView();
    } else if (currentPage == DrawerSection.about) {
      container = const AboutpageView();
    } else if (currentPage == DrawerSection.contact) {
      container = const ContactPageView();
    } else if (currentPage == DrawerSection.agents) {
      container = const AgentPageView();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nest Finder"),
      ),
      body: Center(
        child: SizedBox(
          width: containerWidth, // Set width based on screen size
          child: container,
        ),
      ),
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
            currentPage =
                DrawerSection.values[id - 1]; // Using the correct enum value
          });
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
