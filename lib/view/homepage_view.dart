import 'package:flutter/material.dart';
import 'package:nest_finder/view/drawer_homepage_view.dart';

class HomepageView extends StatefulWidget {
  const HomepageView({super.key});

  @override
  _HomepageViewState createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  // Variable to track which button is selected (true for "Buy", false for "Rent")
  bool isBuySelected = true;

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Adjust image height based on screen width (portrait/landscape)
    double imageHeight =
        screenWidth < screenHeight ? screenHeight * 0.3 : screenHeight * 0.4;

    // Determine the appropriate padding based on screen width (mobile vs tablet)
    double horizontalPadding = screenWidth * 0.05;
    double verticalPadding = screenHeight * 0.02;

    // Determine button width based on screen size
    double buttonWidth =
        screenWidth < 600 ? screenWidth * 0.30 : screenWidth * 0.25;

    // Text size for smaller screens
    double titleFontSize = screenWidth > 600 ? 26 : 20;
    double subtitleFontSize = screenWidth > 600 ? 18 : 14;
    double buttonFontSize = screenWidth > 600 ? 18 : 14;

    // Experience Card size (smaller for mobile view)
    double experienceCardWidth = screenWidth < 600 ? screenWidth * 0.28 : 200;
    double experienceCardHeight = screenWidth < 600 ? screenWidth * 0.28 : 200;
    double experienceFontSize = screenWidth < 600 ? 20 : 32;
    double experienceLabelFontSize = screenWidth < 600 ? 10 : 14;

    // Input field and search button size (smaller for mobile view)
    double inputFieldHeight = screenWidth < 600 ? 15 : 25;
    double searchButtonHeight = screenWidth < 600 ? 40 : 70;
    double searchButtonWidth = screenWidth < 600 ? 60 : 80;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Open the drawer when the menu icon is pressed
            Scaffold.of(context).openDrawer();
          },
        ),
        title: const Text("NestFinder"),
      ),
      body: SingleChildScrollView(
        // Use SingleChildScrollView to prevent overflow
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image at the top
            Container(
              width: double.infinity,
              height: imageHeight,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/homepage_image.png"), // Replace with your image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Short description in the middle
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

            // Row for Buy and Rent buttons with dynamic width, left aligned
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Buy button
                  _buildActionButton(
                      "Buy",
                      isBuySelected ? Colors.black : Colors.white,
                      isBuySelected ? Colors.white : Colors.black,
                      buttonWidth,
                      buttonFontSize,
                      true),
                  // Rent button
                  _buildActionButton(
                      "Rent",
                      isBuySelected ? Colors.white : Colors.black,
                      isBuySelected ? Colors.black : Colors.white,
                      buttonWidth,
                      buttonFontSize,
                      false),
                ],
              ),
            ),

            // New Container with row for Min Price, Max Price, Country, no margins between input fields
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
                      // Min Price
                      _buildCompactInputField("Min Price", inputFieldHeight),
                      // Max Price
                      _buildCompactInputField("Max Price", inputFieldHeight),
                      // Country
                      _buildCompactInputField("Country", inputFieldHeight),
                      // Search Button (Added to the end of the row)
                      _buildSearchButton(searchButtonWidth, searchButtonHeight),
                    ],
                  ),
                ),
              ),
            ),

            // New Container with 3 "16+" and "Years of Experience" sections
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.07,
                  vertical: screenHeight * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Wrap the experience cards inside Flexible to make them responsive
                  Flexible(
                    flex: 1,
                    child: _buildExperienceCard(
                        "16+",
                        "Years of Experience",
                        experienceCardWidth,
                        experienceCardHeight,
                        experienceFontSize,
                        experienceLabelFontSize),
                  ),
                  const SizedBox(width: 12), // Add gap between cards
                  Flexible(
                    flex: 1,
                    child: _buildExperienceCard(
                        "200+",
                        "Award Gained",
                        experienceCardWidth,
                        experienceCardHeight,
                        experienceFontSize,
                        experienceLabelFontSize),
                  ),
                  const SizedBox(width: 12), // Add gap between cards
                  Flexible(
                    flex: 1,
                    child: _buildExperienceCard(
                        "999+",
                        "Property Ready",
                        experienceCardWidth,
                        experienceCardHeight,
                        experienceFontSize,
                        experienceLabelFontSize),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Drawer that holds the DrawerHomepageView
      drawer: const Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHomepageView(),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build each action button (Buy and Rent)
  Widget _buildActionButton(String label, Color bgColor, Color textColor,
      double buttonWidth, double buttonFontSize, bool isBuy) {
    return Container(
      width: buttonWidth,
      height: 50, // Increased height for better accessibility
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
        onPressed: () {
          setState(() {
            // Toggle button selection
            isBuySelected = isBuy;
          });
          print('$label button pressed');
        },
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: buttonFontSize, // Adjust font size for smaller screens
          ),
        ),
      ),
    );
  }

  // Helper method to build each input field without background and icon
  Widget _buildCompactInputField(String label, double height) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        padding: EdgeInsets.symmetric(
            vertical: height, horizontal: 8.0), // Adjust padding
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  // Helper method to build the search button
  Widget _buildSearchButton(
      double searchButtonWidth, double searchButtonHeight) {
    return Container(
      width: searchButtonWidth,
      height: searchButtonHeight,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        onPressed: () {
          // Handle the search functionality
          print("Search pressed");
        },
        icon: const Icon(
          Icons.search,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  // Helper method to create a card for "16+" and "Years of Experience"
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
}
