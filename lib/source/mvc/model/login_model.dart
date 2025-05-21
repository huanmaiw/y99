class LoginModel {
  final String phone;
  final String password;

  LoginModel({required this.phone, required this.password});

  Map<String, dynamic> toJson() => {
    'username': phone,
    'password': password,
  };
}
