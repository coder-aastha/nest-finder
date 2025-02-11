import 'package:flutter/material.dart';
import 'package:nest_finder/features/property/presentation/view/add_property_form_view.dart';
import 'package:nest_finder/features/property/presentation/view/property_detail_page_view.dart';
import 'package:nest_finder/features/property/presentation/view/property_search_delegate.dart';

// Property model class
class Property {
  final int id;
  final String title;
  final List<String> images;
  final int bedrooms;
  final int bathrooms;
  final double price;
  final String address;
  final String description;
  bool isInWishlist;
  bool isInCreatedListings;

  Property({
    required this.id,
    required this.title,
    required this.images,
    required this.bedrooms,
    required this.bathrooms,
    required this.price,
    required this.address,
    required this.description,
    this.isInWishlist = false,
    this.isInCreatedListings = false,
  });
}

class PropertyListingPage extends StatefulWidget {
  final List<Property> propertyListings;

  const PropertyListingPage({super.key, required this.propertyListings});

  @override
  State<PropertyListingPage> createState() => _PropertyListingPageState();
}

class _PropertyListingPageState extends State<PropertyListingPage> {
  RangeValues _priceRange = const RangeValues(0, 1000000);
  List<Property> _filteredListings = [];

  @override
  void initState() {
    super.initState();
    _filteredListings = widget.propertyListings;
    if (widget.propertyListings.isNotEmpty) {
      double maxPrice = widget.propertyListings
          .map((p) => p.price)
          .reduce((a, b) => a > b ? a : b);
      _priceRange = RangeValues(0, maxPrice);
    }
  }

  void _applyFilters(RangeValues priceRange) {
    setState(() {
      _priceRange = priceRange;
      _filteredListings = widget.propertyListings
          .where((property) =>
              property.price >= _priceRange.start &&
              property.price <= _priceRange.end)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Property Listings",
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: PropertySearchDelegate(
                  properties: widget.propertyListings,
                  onAddToWishlist: (property) {
                    setState(() => property.isInWishlist = true);
                  },
                  onRemoveFromWishlist: (property) {
                    setState(() => property.isInWishlist = false);
                  },
                  onAddToCreatedListings: (property) {
                    setState(() => property.isInCreatedListings = true);
                  },
                  onRemoveFromCreatedListings: (property) {
                    setState(() => property.isInCreatedListings = false);
                  },
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterBottomSheet(context),
          ),
        ],
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Column(
        children: [
          if (_priceRange.start > 0 || _priceRange.end < 10000)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    'Price Range: \$${_priceRange.start.toStringAsFixed(0)} - \$${_priceRange.end.toStringAsFixed(0)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  IconButton(
                    icon: const Icon(Icons.clear, size: 20),
                    onPressed: () {
                      setState(() {
                        _priceRange = const RangeValues(0, 10000);
                        _filteredListings = widget.propertyListings;
                      });
                    },
                  ),
                ],
              ),
            ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 2; // Phones
                if (constraints.maxWidth >= 600) crossAxisCount = 3; // Tablets
                if (constraints.maxWidth >= 900) crossAxisCount = 4; // Large screens

                return CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(16.0),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final property = _filteredListings[index];
                            return _buildPropertyCard(context, property);
                          },
                          childCount: _filteredListings.length,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPropertyPage(
                onPropertyAdded: (newProperty) {
                  setState(() {
                    widget.propertyListings.add(newProperty);
                    _filteredListings = widget.propertyListings;
                  });
                },
              ),
            ),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Property'),
        elevation: 4,
      ),
    );
  }

  Widget _buildPropertyCard(BuildContext context, Property property) {
    return Hero(
      tag: 'property-${property.id}',
      child: Material(
        borderRadius: BorderRadius.circular(16),
        elevation: 4,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PropertyDetailPage(
                  property: property,
                  onAddToWishlist: (p) => setState(() => p.isInWishlist = true),
                  onRemoveFromWishlist: (p) =>
                      setState(() => p.isInWishlist = false),
                  onAddToCreatedListings: (p) =>
                      setState(() => p.isInCreatedListings = true),
                  onRemoveFromCreatedListings: (p) =>
                      setState(() => p.isInCreatedListings = false),
                ),
              ),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🖼️ Image - Full width
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  property.images.isNotEmpty ? property.images[0] : '',
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Image.asset(
                    'assets/images/default_avatar.png',
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // 📄 Description - Full width with flexible text
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        property.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              property.address,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        "\$${property.price.toStringAsFixed(0)}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    RangeValues tempPriceRange = _priceRange;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Filter Properties',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 24),
                  const Text('Price Range',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${tempPriceRange.start.toStringAsFixed(0)}',
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                      Text('\$${tempPriceRange.end.toStringAsFixed(0)}',
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  RangeSlider(
                    values: tempPriceRange,
                    min: 0,
                    max: 1000000,
                    divisions: 100,
                    labels: RangeLabels(
                      '\$${tempPriceRange.start.toStringAsFixed(0)}',
                      '\$${tempPriceRange.end.toStringAsFixed(0)}',
                    ),
                    onChanged: (values) {
                      setModalState(() {
                        tempPriceRange = values;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _applyFilters(tempPriceRange);
                            Navigator.pop(context);
                          },
                          child: const Text('Apply Filters'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
