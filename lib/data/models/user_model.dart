class UserModel {
  final String email;
  final String username;

  UserModel({required this.email, required this.username});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(email: json['email'], username: json['username']);
  }
}