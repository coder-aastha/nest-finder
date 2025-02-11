import 'package:flutter/material.dart';
import 'package:nest_finder/features/property/presentation/view/property_listing_page_view.dart';


class PropertyDetailPage extends StatefulWidget {
  final Property property;
  final Function(Property) onAddToWishlist;
  final Function(Property) onRemoveFromWishlist;
  final Function(Property) onAddToCreatedListings;
  final Function(Property) onRemoveFromCreatedListings;

  const PropertyDetailPage({
    super.key,
    required this.property,
    required this.onAddToWishlist,
    required this.onRemoveFromWishlist,
    required this.onAddToCreatedListings,
    required this.onRemoveFromCreatedListings,
  });

  @override
  State<PropertyDetailPage> createState() => _PropertyDetailPageState();
}

class _PropertyDetailPageState extends State<PropertyDetailPage> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  PageView.builder(
                    itemCount: widget.property.images.length,
                    onPageChanged: (index) {
                      setState(() => _currentImageIndex = index);
                    },
                    itemBuilder: (context, index) {
                      return Image.network(
                        widget.property.images[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/images/default_avatar.png');
                        },
                      );
                    },
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${_currentImageIndex + 1}/${widget.property.images.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$${widget.property.price.toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              widget.property.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              widget.onAddToWishlist(widget.property);
                            },
                            icon: Icon(
                              widget.property.isInWishlist
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: widget.property.isInWishlist
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // Handle share
                            },
                            icon: const Icon(Icons.share, color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          widget.property.address,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildFeatureItem(
                        Icons.king_bed,
                        '${widget.property.bedrooms} Beds',
                      ),
                      const SizedBox(width: 12),
                      _buildFeatureItem(
                        Icons.bathroom,
                        '${widget.property.bathrooms} Baths',
                      ),
                      const SizedBox(width: 12),
                      _buildFeatureItem(
                        Icons.location_on,
                        'View on Map',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.property.description,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle contact agent
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Contact Agent',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: Colors.blue),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}