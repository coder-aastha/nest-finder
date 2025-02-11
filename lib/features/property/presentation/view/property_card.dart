import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  final Map<String, dynamic> property;
  final VoidCallback onTap;

  const PropertyCard({
    super.key,
    required this.property,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Image.network(
                property['images']?.first ?? '',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property['title'] ?? 'Unknown Property',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(property['address'] ?? 'No Address'),
                    const SizedBox(height: 4),
                    Text('\$${property['price']}',
                        style: const TextStyle(color: Colors.green)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.bed, size: 16),
                        const SizedBox(width: 4),
                        Text('${property['bedrooms']} Beds'),
                        const SizedBox(width: 16),
                        const Icon(Icons.bathtub, size: 16),
                        const SizedBox(width: 4),
                        Text('${property['bathrooms']} Baths'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
