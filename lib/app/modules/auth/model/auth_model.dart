class User {
  final int id;
  final String name;
  final String email;
  final int penaltyPoints;
  final bool isAdmin;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.penaltyPoints = 0,
    this.isAdmin = false,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      penaltyPoints: json['penalty_points'] ?? 0,
      isAdmin: json['is_admin'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'penalty_points': penaltyPoints,
      'is_admin': isAdmin,
    };
  }
}