import 'package:flutter/foundation.dart';
import 'package:nest_finder/features/property/presentation/view/property_listing_page_view.dart';

class PropertyModel extends ChangeNotifier {
  final List<Property> _wishlist = [];
  final List<Property> _createdListings = [];

  List<Property> get wishlist => _wishlist;
  List<Property> get createdListings => _createdListings;

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
}
