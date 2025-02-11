import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> propertyData = {
    'id': 3,
    'title': "A New Apartment in the City!",
    'images': [
      "https://images.pexels.com/photos/2062426/pexels-photo-2062426.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
    ],
    'bedrooms': 1,
    'bathrooms': 1,
    'price': 800,
    'address': "101 Baker Street, London",
    'description':
        'Find your dream home today! Browse a wide selection of homes, apartments, and commercial properties in top locations.',
  };

  DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Property Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  propertyData['images'][0],
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
                Text(
                  propertyData['title'],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text('Bedrooms: ${propertyData['bedrooms']}'),
                Text('Bathrooms: ${propertyData['bathrooms']}'),
                Text('Price: \$${propertyData['price']}'),
                Text('Address: ${propertyData['address']}'),
                const SizedBox(height: 16),
                Text(propertyData['description']),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
