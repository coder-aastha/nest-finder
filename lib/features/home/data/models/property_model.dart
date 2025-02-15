class Property {
  final int id;
  final String title;
  final String location;
  final double price;
  final String imageUrl;

  Property({
    required this.id,
    required this.title,
    required this.location,
    required this.price,
    required this.imageUrl,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      title: json['title'],
      location: json['location'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
    );
  }
}
