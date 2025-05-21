class RegisterModel {
  final String fullname;
  final String phone;
  final String email;
  final String? note;
  final String? content;

  RegisterModel({
    required this.fullname,
    required this.phone,
    required this.email,
    this.note,
    this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      "fullname": fullname,
      "phone": phone,
      "email": email,
      "note": note,
      "content": content,
    };
  }
}
