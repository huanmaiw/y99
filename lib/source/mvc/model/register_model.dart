class RegisterModel {
  final String fullName;
  final String birthDate;
  final String phone;
  final String gender;

  RegisterModel({
    required this.fullName,
    required this.birthDate,
    required this.phone,
    required this.gender,
  });

  Map<String, dynamic> toJson() => {
    'fullName': fullName,
    'birthDate': birthDate,
    'phone': phone,
    'gender': gender,
  };
}
