class Property {
  final int id;
  final String title;
  final List<String> images;
  final int bedrooms;
  final int bathrooms;
  final double price;
  final String address;
  final String description;

  Property({
    required this.id,
    required this.title,
    required this.images,
    required this.bedrooms,
    required this.bathrooms,
    required this.price,
    required this.address,
    required this.description,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      title: json['title'],
      images: List<String>.from(json['images'] ?? []),
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      price: json['price'].toDouble(),
      address: json['address'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'images': images,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'price': price,
      'address': address,
      'description': description,
    };
  }
}