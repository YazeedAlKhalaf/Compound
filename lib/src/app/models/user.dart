class User {
  final String id;
  final String fullName;
  final String email;

  User({
    this.id,
    this.fullName,
    this.email,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fullName = json['fullName'],
        email = json['email'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
    };
  }
}
