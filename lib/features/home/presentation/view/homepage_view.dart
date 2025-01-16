import 'package:flutter/material.dart';
import 'package:nest_finder/features/home/presentation/view_model/home_state.dart';
import 'package:provider/provider.dart';
import 'package:nest_finder/features/home/presentation/view/aboutpage_view.dart';
import 'package:nest_finder/features/home/presentation/view/agentpage_view.dart';
import 'package:nest_finder/features/home/presentation/view/contactpage_view.dart';
import 'package:nest_finder/features/home/presentation/view/my_header_drawer_view.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeState(),
      child: const _HomepageViewContent(),
    );
  }
}

class _HomepageViewContent extends StatelessWidget {
  const _HomepageViewContent();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 768;

    return Scaffold(
      appBar: AppBar(
        title: const Text("NestFinder"),
      ),
      drawer: SizedBox(
        width: isTablet ? screenWidth * 0.4 : screenWidth * 0.75,
        child: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const MyHeaderDrawerView(),
                myDrawerListView(context),
              ],
            ),
          ),
        ),
      ),
      body: _getPageForCurrentSection(context),
    );
  }

  Widget _getPageForCurrentSection(BuildContext context) {
    final currentPage = context.watch<HomeState>().currentPage;
    
    switch (currentPage) {
      case DrawerSection.home:
        return _buildHomeContent(context);
      case DrawerSection.about:
        return const AboutpageView();
      case DrawerSection.contact:
        return const ContactPageView();
      case DrawerSection.agents:
        return const AgentPageView();
    }
  }

  Widget _buildHomeContent(BuildContext context) {
    final homeState = context.watch<HomeState>();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double imageHeight = screenWidth < screenHeight ? screenHeight * 0.3 : screenHeight * 0.4;
    double horizontalPadding = screenWidth * 0.05;
    double verticalPadding = screenHeight * 0.02;
    double buttonWidth = screenWidth < 600 ? screenWidth * 0.30 : screenWidth * 0.25;
    double titleFontSize = screenWidth > 600 ? 26 : 20;
    double subtitleFontSize = screenWidth > 600 ? 18 : 14;
    double buttonFontSize = screenWidth > 600 ? 18 : 14;
    double experienceCardWidth = screenWidth < 600 ? screenWidth * 0.28 : 200;
    double experienceCardHeight = screenWidth < 600 ? screenWidth * 0.28 : 200;
    double experienceFontSize = screenWidth < 600 ? 20 : 32;
    double experienceLabelFontSize = screenWidth < 600 ? 10 : 14;
    double inputFieldHeight = screenWidth < 600 ? 15 : 25;
    double searchButtonHeight = screenWidth < 600 ? 40 : 70;
    double searchButtonWidth = screenWidth < 600 ? 60 : 80;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: imageHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/homepage_image.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: verticalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover Your Dream Home & Find Your Perfect Place',
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Browse through a wide selection of properties to find the perfect match for your lifestyle. Whether you\'re looking to buy or rent, discover your ideal home with ease and start a new chapter today.',
                  style: TextStyle(
                    fontSize: subtitleFontSize,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildActionButton(
                    context,
                    "Buy",
                    homeState.isBuySelected ? Colors.black : Colors.white,
                    homeState.isBuySelected ? Colors.white : Colors.black,
                    buttonWidth,
                    buttonFontSize,
                    true),
                _buildActionButton(
                    context,
                    "Rent",
                    homeState.isBuySelected ? Colors.white : Colors.black,
                    homeState.isBuySelected ? Colors.black : Colors.white,
                    buttonWidth,
                    buttonFontSize,
                    false),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: 12.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    _buildCompactInputField(context, "Min Price", inputFieldHeight, (value) => homeState.updateMinPrice(value)),
                    _buildCompactInputField(context, "Max Price", inputFieldHeight, (value) => homeState.updateMaxPrice(value)),
                    _buildCompactInputField(context, "Country", inputFieldHeight, (value) => homeState.updateCountry(value)),
                    _buildSearchButton(context, searchButtonWidth, searchButtonHeight),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.07, vertical: screenHeight * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var cardData in homeState.experienceCards)
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: _buildExperienceCard(
                        cardData.number,
                        cardData.label,
                        experienceCardWidth,
                        experienceCardHeight,
                        experienceFontSize,
                        experienceLabelFontSize,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String label, Color bgColor,
      Color textColor, double buttonWidth, double buttonFontSize, bool isBuy) {
    return Container(
      width: buttonWidth,
      height: 50,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFDEDDDA)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () => context.read<HomeState>().toggleBuyRent(isBuy),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: buttonFontSize,
          ),
        ),
      ),
    );
  }

  Widget _buildCompactInputField(BuildContext context, String label, double height, Function(String) onChanged) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        padding: EdgeInsets.symmetric(vertical: height, horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
        ),
        child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: label,
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchButton(BuildContext context, double searchButtonWidth, double searchButtonHeight) {
    return Container(
      width: searchButtonWidth,
      height: searchButtonHeight,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        onPressed: () => context.read<HomeState>().search(),
        icon: const Icon(
          Icons.search,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  Widget _buildExperienceCard(String number, String label, double width,
      double height, double fontSize, double labelFontSize) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: labelFontSize,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget myDrawerListView(BuildContext context) {
    final homeState = context.watch<HomeState>();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 768;

    return Container(
      padding: EdgeInsets.only(
        top: isTablet ? 30 : 15,
        left: isTablet ? 20 : 0,
        right: isTablet ? 20 : 0,
      ),
      child: Column(
        children: [
          _buildMenuItem(context, 1, "Home", Icons.home_max_outlined,
              homeState.currentPage == DrawerSection.home, isTablet),
          _buildMenuItem(context, 2, "About", Icons.info_outline,
              homeState.currentPage == DrawerSection.about, isTablet),
          _buildMenuItem(context, 3, "Contact", Icons.contact_mail_outlined,
              homeState.currentPage == DrawerSection.contact, isTablet),
          _buildMenuItem(context, 4, "Agent", Icons.account_box_outlined,
              homeState.currentPage == DrawerSection.agents, isTablet),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, int id, String title, IconData icon,
      bool isActive, bool isTablet) {
    return Material(
      color: isActive ? Colors.blue[100] : Colors.transparent,
      child: InkWell(
        onTap: () {
          context.read<HomeState>().setCurrentPage(DrawerSection.values[id - 1]);
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: isTablet ? 20.0 : 15.0,
            horizontal: isTablet ? 25.0 : 15.0,
          ),
          margin: EdgeInsets.symmetric(
            vertical: isTablet ? 8.0 : 4.0,
            horizontal: isTablet ? 8.0 : 0.0,
          ),
          decoration: BoxDecoration(
            borderRadius:
                isTablet ? BorderRadius.circular(12) : BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: isTablet ? 28 : 20,
                color: isActive ? Colors.blue[700] : Colors.black,
              ),
              SizedBox(width: isTablet ? 25 : 15),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: isActive ? Colors.blue[700] : Colors.black,
                    fontSize: isTablet ? 18 : 16,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
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