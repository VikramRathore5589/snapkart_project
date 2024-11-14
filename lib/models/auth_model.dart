class AuthModel {
  String? username;
  String? password;

  AuthModel({required this.username, required this.password});

  Map<String, dynamic> toMap() {
    return {'username': username, 'password': password};
  }

  static AuthModel fromJson(Map<String, dynamic> map) {
    return AuthModel(username: map['username'], password: map['password']);
  }
}
