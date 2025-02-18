import 'package:flutter/material.dart';
import 'package:nest_finder/features/property/presentation/view/property_listing_page_view.dart';

class ProfileState extends ChangeNotifier {
  RangeValues _priceRange = const RangeValues(0, 1000000);
  final List<Property> _wishlist = [];
  final List<Property> _createdListings = [];
  List<Property> _propertyListings = [];

  RangeValues get priceRange => _priceRange;
  List<Property> get wishlist => _wishlist;
  List<Property> get createdListings => _createdListings;
  List<Property> get propertyListings => _propertyListings;

  void updatePriceRange(RangeValues newRange) {
    _priceRange = newRange;
    notifyListeners();
  }

  void resetPriceRange() {
    _priceRange = const RangeValues(0, 1000000);
    notifyListeners();
  }

  void addToWishlist(Property property) {
    if (!_wishlist.contains(property)) {
      _wishlist.add(property);
      notifyListeners();
    }
  }

  void removeFromWishlist(Property property) {
    if (_wishlist.contains(property)) {
      _wishlist.remove(property);
      notifyListeners();
    }
  }

  void toggleWishlist(Property property) {
    if (_wishlist.contains(property)) {
      removeFromWishlist(property);
    } else {
      addToWishlist(property);
    }
  }

  void addToCreatedListings(Property property) {
    if (!_createdListings.contains(property)) {
      _createdListings.add(property);
      notifyListeners();
    }
  }

  void removeFromCreatedListings(Property property) {
    if (_createdListings.contains(property)) {
      _createdListings.remove(property);
      notifyListeners();
    }
  }

  void setPropertyListings(List<Property> listings) {
    _propertyListings = listings;
    notifyListeners();
  }
}
