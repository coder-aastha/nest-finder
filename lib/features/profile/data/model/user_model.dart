class UserModel {
  final String id;
  final String name;
  final String profileImageUrl;

  UserModel({required this.id, required this.name, required this.profileImageUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      profileImageUrl: json['profileImageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'profileImageUrl': profileImageUrl};
  }
}
