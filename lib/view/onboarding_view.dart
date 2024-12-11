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