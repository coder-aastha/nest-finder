import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../view_model/onboarding_view_model.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  double _getFontSize(BuildContext context) {
    return MediaQuery.of(context).size.width > 600 ? 36.0 : 30.0;
  }

  Widget _buildPage({
    required String urlImage,
    required String title,
    required String subtitle,
    required double fontSize,
  }) =>
      Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(urlImage, fit: BoxFit.cover, width: double.infinity),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue.shade200,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OnboardingViewModel>(context);
    final fontSize = _getFontSize(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: viewModel.controller,
          children: [
            _buildPage(
              urlImage: "assets/images/on_boarding_images/onboarding_image1.png",
              title: "Welcome to Your New Home Journey!",
              subtitle: "Discover a world of beautiful homes and exciting opportunities.",
              fontSize: fontSize,
            ),
            _buildPage(
              urlImage: "assets/images/on_boarding_images/onboarding_image2.png",
              title: "Find Your Dream Home",
              subtitle: "Browse through our curated listings of stunning properties.",
              fontSize: fontSize,
            ),
            _buildPage(
              urlImage: "assets/images/on_boarding_images/onboarding_image3.png",
              title: "Congratulations! You're Almost Home.",
              subtitle: "From browsing to buying, we've got you covered.",
              fontSize: fontSize,
            ),
          ],
        ),
      ),
      bottomSheet: viewModel.isLastPage
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.teal,
                  minimumSize: const Size.fromHeight(80),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () => viewModel.navigateToLogin(context),
                child: Text(
                  "Get Started",
                  style: TextStyle(fontSize: fontSize, color: Colors.white),
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: viewModel.skipToLastPage, child: const Text("SKIP")),
                  SmoothPageIndicator(
                    controller: viewModel.controller,
                    count: 3,
                    effect: const WormEffect(
                      spacing: 16,
                      dotColor: Colors.black26,
                      activeDotColor: Color.fromARGB(255, 39, 182, 168),
                    ),
                  ),
                  TextButton(onPressed: viewModel.goToNextPage, child: const Text("NEXT")),
                ],
              ),
            ),
    );
  }
}
