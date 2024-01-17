class User {
  String? id = '';
  String? name = '';
  String email;
  String? password;

  User({
    required this.email,
    this.id,
    this.name,
    this.password
  });
}