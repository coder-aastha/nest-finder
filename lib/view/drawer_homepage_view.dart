import 'package:flutter/material.dart';

class DrawerHomepageView extends StatelessWidget {
  const DrawerHomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Adjust image height based on screen width (portrait/landscape)
    double imageHeight = screenWidth < screenHeight ? 250 : screenHeight * 0.4;

    return Scaffold(
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

            // Short description in the middle
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Discover Your Dream Home & Find Your Perfect Place',
                    style: TextStyle(
                      fontSize: screenWidth > 600
                          ? 23
                          : 20, // Adjust font size based on screen width
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Browse through a wide selection of properties to find the perfect match for your lifestyle. Whether you\'re looking to buy or rent, discover your ideal home with ease and start a new chapter today.',
                    style: TextStyle(
                      fontSize: screenWidth > 600
                          ? 16
                          : 14, // Adjust font size based on screen width
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // Row for Buy and Rent buttons with dynamic width, left aligned
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Buy button (left aligned, no margin)
                  _buildActionButton(
                      "Buy", Colors.white, Colors.black, screenWidth),

                  // Rent button (left aligned, no margin)
                  _buildActionButton(
                      "Rent", Colors.black, Colors.white, screenWidth),
                ],
              ),
            ),

            // New Container with row for Min Price, Max Price, Country, no margins between input fields
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05, vertical: 2.0),
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
                child: Row(
                  children: [
                    // Min Price
                    _buildCompactInputField("Min Price"),

                    // Max Price
                    _buildCompactInputField("Max Price"),

                    // Country
                    _buildCompactInputField("Country"),

                    // Search Button (Added to the end of the row)
                    _buildSearchButton(),
                  ],
                ),
              ),
            ),

            // New Container with 3 "16+" and "Years of Experience" sections
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.05,
                  top: 19.0,
                  bottom: 19.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildExperienceCard("16+", "Years of Experience"),
                  _buildExperienceCard("200+", "Award Gained"),
                  _buildExperienceCard("999+", "Property Ready"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each action button (Buy and Rent)
  // Helper method to build each action button (Buy and Rent)
  Widget _buildActionButton(
      String label, Color bgColor, Color textColor, double screenWidth) {
    return Container(
      width: screenWidth *
          0.20, // Reduced width for the button (from 0.35 to 0.30)
      height: 40, // Reduced height for the button (from 50 to 40)
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
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
          // Handle button press
          print('$label button pressed');
        },
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: screenWidth > 600
                ? 16
                : 14, // Adjust font size for smaller screens
          ),
        ),
      ),
    );
  }

  // Helper method to build each input field without background and icon
  Widget _buildCompactInputField(String label) {
    return Expanded(
      // Use Expanded to ensure input fields resize appropriately
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        padding: const EdgeInsets.symmetric(
            vertical: 12.0, horizontal: 8.0), // Adjust padding
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
  Widget _buildSearchButton() {
    return Container(
      width: 60,
      height: 50,
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
  Widget _buildExperienceCard(String number, String label) {
    return Container(
      width: 100, // Fixed width for each card
      height: 100, // Fixed height for each card
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
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
