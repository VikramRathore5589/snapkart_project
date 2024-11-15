class AuthModel {
 final String username;
 final  String password;

  AuthModel({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {'username':username , 'password': password};
  }

  static AuthModel fromJson(Map<String, dynamic> map) {
    return AuthModel(username: map['username'], password: map['password']);
  }
}
