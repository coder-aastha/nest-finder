import 'package:flutter/material.dart';
import 'package:nest_finder/features/property/presentation/view/property_detail_page_view.dart';
import 'package:nest_finder/features/property/presentation/view/property_listing_page_view.dart';

class PropertySearchDelegate extends SearchDelegate {
  final List<Property> properties;
  final Function(Property) onAddToWishlist;
  final Function(Property) onRemoveFromWishlist;
  final Function(Property) onAddToCreatedListings;
  final Function(Property) onRemoveFromCreatedListings;

  PropertySearchDelegate({
    required this.properties,
    required this.onAddToWishlist,
    required this.onRemoveFromWishlist,
    required this.onAddToCreatedListings,
    required this.onRemoveFromCreatedListings,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final filteredProperties = properties.where((property) {
      final searchQuery = query.toLowerCase();
      final titleMatch = property.title.toLowerCase().contains(searchQuery);
      final addressMatch = property.address.toLowerCase().contains(searchQuery);
      final priceMatch = property.price.toString().contains(searchQuery);

      return titleMatch || addressMatch || priceMatch;
    }).toList();

    if (filteredProperties.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.search_off,
              size: 64,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              'No properties found for "$query"',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredProperties.length,
      itemBuilder: (context, index) {
        final property = filteredProperties[index];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              property.images.isNotEmpty ? property.images[0] : 'https://via.placeholder.com/150',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/images/default_avatar.png');
              },
            ),
          ),
          title: Text(
            property.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                property.address,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '\$${property.price.toStringAsFixed(0)}',
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          isThreeLine: true,
          onTap: () {
            close(context, property);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PropertyDetailPage(
                  property: property,
                  onAddToWishlist: (property) {
                    onAddToWishlist(property);
                  },
                  onRemoveFromWishlist: (property) {
                    onRemoveFromWishlist(property);
                  },
                  onAddToCreatedListings: (property) {
                    onAddToCreatedListings(property);
                  },
                  onRemoveFromCreatedListings: (property) {
                    onRemoveFromCreatedListings(property);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}