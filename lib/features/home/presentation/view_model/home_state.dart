import 'package:flutter/material.dart';

enum DrawerSection {
  home,
  about,
  contact,
  agents,
}

class HomeState extends ChangeNotifier {
  // Current drawer section
  DrawerSection _currentPage = DrawerSection.home;
  DrawerSection get currentPage => _currentPage;

  // Buy/Rent selection state
  bool _isBuySelected = true;
  bool get isBuySelected => _isBuySelected;

  // Search form states
  String _minPrice = '';
  String _maxPrice = '';
  String _country = '';

  String get minPrice => _minPrice;
  String get maxPrice => _maxPrice;
  String get country => _country;

  // Experience card data
  final List<ExperienceCardData> experienceCards = [
    ExperienceCardData(number: '16+', label: 'Years of Experience'),
    ExperienceCardData(number: '200+', label: 'Award Gained'),
    ExperienceCardData(number: '999+', label: 'Property Ready'),
  ];

  // Factory constructor for initial state
  factory HomeState.initial() {
    return HomeState(
      currentPage: DrawerSection.home,
      isBuySelected: true,
      minPrice: '',
      maxPrice: '',
      country: '',
    );
  }

  // Constructor
  HomeState({
    DrawerSection? currentPage,
    bool? isBuySelected,
    String? minPrice,
    String? maxPrice,
    String? country,
  })  : _currentPage = currentPage ?? DrawerSection.home,
        _isBuySelected = isBuySelected ?? true,
        _minPrice = minPrice ?? '',
        _maxPrice = maxPrice ?? '',
        _country = country ?? '';

  // Methods to update states
  void setCurrentPage(DrawerSection page) {
    _currentPage = page;
    notifyListeners();
  }

  void toggleBuyRent(bool isBuy) {
    _isBuySelected = isBuy;
    notifyListeners();
  }

  void updateMinPrice(String value) {
    _minPrice = value;
    notifyListeners();
  }

  void updateMaxPrice(String value) {
    _maxPrice = value;
    notifyListeners();
  }

  void updateCountry(String value) {
    _country = value;
    notifyListeners();
  }

  void search() {
    // Placeholder for search logic if necessary
  }

  // CopyWith method to return a new state
  HomeState copyWith({
    DrawerSection? currentPage,
    bool? isBuySelected,
    String? minPrice,
    String? maxPrice,
    String? country,
  }) {
    return HomeState(
      currentPage: currentPage ?? _currentPage,
      isBuySelected: isBuySelected ?? _isBuySelected,
      minPrice: minPrice ?? _minPrice,
      maxPrice: maxPrice ?? _maxPrice,
      country: country ?? _country,
    );
  }
}

// Data class for experience cards
class ExperienceCardData {
  final String number;
  final String label;

  ExperienceCardData({
    required this.number,
    required this.label,
  });
}
