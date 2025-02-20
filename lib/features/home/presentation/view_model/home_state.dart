import 'package:flutter/material.dart';
import 'package:nest_finder/features/property/presentation/view/property_listing_page_view.dart';

// Enum for different sections in the drawer
enum DrawerSection {
  home,
  about,
  contact,
  agents,
  propertyListing,
  profile
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

  // List of properties (updated as per your request)
  final List<Property> propertyListings = [
    Property(
      id: 1,
      title: "A Great Apartment Next to the Beach!",
      images: [
        "https://images.pexels.com/photos/1918291/pexels-photo-1918291.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
      ],
      bedrooms: 2,
      bathrooms: 1,
      price: 1000,
      address: "456 Park Avenue, London",
      // latitude: 51.5074,
      // longitude: -0.1278,
      description: 'With spacious living areas, modern finishes, and a beautifully landscaped yard, this property provides a welcoming atmosphere for family living or entertaining guests.',
    ),
    Property(
      id: 2,
      title: "An Awesome Apartment Near the Park! Almost too good to be true!",
      images: [
        "https://images.pexels.com/photos/1428348/pexels-photo-1428348.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
      ],
      bedrooms: 3,
      bathrooms: 2,
      price: 1500,
      address: "789 Oxford Street, London",
      // latitude: 52.4862,
      // longitude: -1.8904,
      description: 'A cozy place to feel like a home',
    ),
    Property(
      id: 3,
      title: "A New Apartment in the City!",
      images: [
        "https://images.pexels.com/photos/2062426/pexels-photo-2062426.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
      ],
      bedrooms: 1,
      bathrooms: 1,
      price: 800,
      address: "101 Baker Street, London",
      // latitude: 53.4808,
      // longitude: -2.2426,
      description: 'Find your dream home today! Browse a wide selection of homes, apartments, and commercial properties in top locations.',
    ),
    Property(
      id: 4,
      title: "Great Location! Great Price! Great Apartment!",
      images: [
        "https://images.pexels.com/photos/2467285/pexels-photo-2467285.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
      ],
      bedrooms: 2,
      bathrooms: 1,
      price: 1000,
      address: "234 Kingsway, London",
      // latitude: 53.8008,
      // longitude: -1.5491,
      description: 'Explore the best real estate deals in your area. Rent or buy your next property with ease and confidence.',
    ),
    Property(
      id: 5,
      title: "Bedroom Apartment with Stunning City Views",
      images: [
        "https://images.pexels.com/photos/276625/pexels-photo-276625.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
      ],
      bedrooms: 3,
      bathrooms: 2,
      price: 1500,
      address: "567 Victoria Road, London",
      // latitude: 53.4084,
      // longitude: -2.9916,
      description: 'Explore the best real estate deals in your area. Rent or buy your next property with ease and confidence.',
    ),
    Property(
      id: 6,
      title: "Modern Studio in the Heart of Downtown",
      images: [
        "https://images.pexels.com/photos/271816/pexels-photo-271816.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
      ],
      bedrooms: 1,
      bathrooms: 1,
      price: 800,
      address: "890 Regent Street, London",
      // latitude: 54.9783,
      // longitude: -1.6174,
      description: 'Looking for a new place to call home? Discover beautiful properties in prime locations, all within your budget',
    ),
    Property(
      id: 7,
      title: "Spacious 3-Bedroom Apartment Near Parks & Transit",
      images: [
        "https://images.pexels.com/photos/2029667/pexels-photo-2029667.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
      ],
      bedrooms: 2,
      bathrooms: 1,
      price: 1000,
      address: "112 Piccadilly, London",
      // latitude: 53.3811,
      // longitude: -1.4701,
      description: 'Looking for an investment property or a new home? Find listings that match your preferences, budget, and location.',
    ),
    Property(
      id: 8,
      title: "Charming Coastal Apartment Just Steps from the Beach",
      images: [
        "https://images.pexels.com/photos/276724/pexels-photo-276724.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
      ],
      bedrooms: 3,
      bathrooms: 2,
      price: 1500,
      address: "8765 Main High Street, London",
      // latitude: 51.4545,
      // longitude: -2.5879,
      description: '',
    ),
  ];

  List<Property> get properties => propertyListings;

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

