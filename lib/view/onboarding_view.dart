import 'package:flutter/material.dart';
import 'package:nest_finder/view/login_page_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController controller = PageController();
  bool isLastPage = false;
  double _currentPage = 0.0; // To keep track of the current page.

  @override
  void initState() {
    super.initState();

    // Add a listener to the PageController to track page changes
    controller.addListener(() {
      if (controller.hasClients) {
        setState(() {
          _currentPage =
              controller.page ?? 0.0; // Update _currentPage when page changes
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildPage({
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              urlImage,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.blue.shade200,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) => {setState(() => isLastPage = index == 2)},
          children: [
            buildPage(
                urlImage:
                    "assets/images/on_boarding_images/onboarding_image1.png",
                title: "Welcome to Your New Home Journey!",
                subtitle:
                    "Discover a world of beautiful homes and exciting opportunities. Let us guide you through every step of the way."),
            buildPage(
                urlImage:
                    "assets/images/on_boarding_images/onboarding_image2.png",
                title: "Find Your Dream Home",
                subtitle:
                    "Browse through our curated listings of stunning properties available for sale. Your perfect home is just a click away."),
            buildPage(
                urlImage:
                    "assets/images/on_boarding_images/onboarding_image3.png",
                title: "Congratulations! You're Almost Home.",
                subtitle:
                    "From browsing to buying, we've helped hundreds of people find their dream homes. Let's make it official!"),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
              child: TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.teal,
                    minimumSize: const Size.fromHeight(80)),
                onPressed: () async {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginPageView()));
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 24, color: Colors.white, fontFamily: "Montserrat Bold"),
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => controller.jumpToPage(2),
                      child: const Text("SKIP")),
                  Center(
                      child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const WormEffect(
                      spacing: 16,
                      dotColor: Colors.black26,
                      activeDotColor: Color.fromARGB(255, 39, 182, 168),
                    ),
                    onDotClicked: (index) {
                      if (index >= 0 && index < 3) {
                        controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                  )),
                  TextButton(
                      onPressed: () {
                        if (_currentPage < 2) {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: const Text("NEXT")),
                ],
              ),
            ),
    );
  }
}
