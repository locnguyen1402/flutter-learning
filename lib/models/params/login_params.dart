class LoginParams {
  late String username;
  late String password;

  LoginParams({required this.username, required this.password});

  LoginParams.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }
}
