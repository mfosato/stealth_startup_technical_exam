class User {
  String id;
  String name;
  String imageUrl;

  User({required this.id, required this.name, required this.imageUrl});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json['id'], name: json['name'], imageUrl: json['imageUrl']);
  }
}
