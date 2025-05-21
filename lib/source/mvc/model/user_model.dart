class UserModel {
  final int id;
  final String username;
  final String fullname;

  UserModel({
    required this.id,
    required this.username,
    required this.fullname,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      fullname: json['fullname'],
    );
  }
}
