import 'package:flutter/material.dart';
import 'package:nest_finder/features/auth/presentation/view/login_page_view.dart';

class OnboardingViewModel extends ChangeNotifier {
  final PageController controller = PageController();
  bool isLastPage = false;
  double currentPage = 0.0;

  OnboardingViewModel() {
    controller.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    if (controller.hasClients) {
      currentPage = controller.page ?? 0.0;
      isLastPage = currentPage.round() == 2;
      notifyListeners();
    }
  }

  void goToNextPage() {
    if (currentPage < 2) {
      controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipToLastPage() {
    controller.jumpToPage(2);
  }

  void navigateToLogin(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginPageView()),
    );
  }

  @override
  void dispose() {
    controller.removeListener(_onPageChanged);
    controller.dispose();
    super.dispose();
  }
}
