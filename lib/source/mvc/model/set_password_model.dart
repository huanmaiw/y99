class SetPasswordRequest {
  final String password;

  SetPasswordRequest({required this.password});

  Map<String, dynamic> toJson() => {
    'password': password,
  };
}
