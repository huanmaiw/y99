import 'package:Y99/core/dio/api/dio_app.dart';
import 'package:Y99/core/dio/auth_repo.dart';
class AuthDataSource {
  final AuthRepo _repo = AuthRepo(AppDio.instance.provideDio());

  AuthDataSource._internal();

  static final AuthDataSource instance = AuthDataSource._internal();

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    final res = await _repo.login(username: username, password: password);
    return res.success == true;
  }

  Future verifyEmail({
    required String email,
    bool? isForgotPassword,
  }) async {
    final res = await _repo.verifyEmail(
        email: email, isForgotPassword: isForgotPassword ?? false);
    return res.success == true;
  }

  // Future confirmEmail({
  //   required String email,
  //   required String code,
  //   bool? isForgotPassword,
  // }) async {
  //   final res = await _repo.confirmEmail(
  //     email: email,
  //     code: code,
  //     isForgotPassword: isForgotPassword ?? false,
  //   );
  //   return res.success == true;
  // }

  Future<bool> register({
    required String password,
    String? email,
    String? phoneNumber,
    required String fullName,
  }) async {
    final res = await _repo.register(
        password: password,
        email: email,
        fullName: fullName,
        phoneNumber: phoneNumber);
    return res.success == true;
  }

  // Future<bool> changePassword({
  //   required String oldPassword,
  //   required String password,
  // }) async {
  //   final res = await _repo.changePassword(
  //     password: password,
  //     oldPassword: oldPassword,
  //   );
  //   return res.success == true;
  // }
  //
  // Future<bool> forgotPassword({
  //   String? email,
  //   required String password,
  //   String? phoneNumber,
  // }) async {
  //   final res = await _repo.forgotPassword(
  //     email: email,
  //     password: password,
  //     phoneNumber: phoneNumber,
  //   );
  //   return res.success == true;
  // }

  // Future<Profile> getInfo() async {
  //   final res = await _repo.getInfo();
  //   return res.data!;
  // }

  // Future<bool> updateInfo({
  //   required int id,
  //   String? fullName,
  //   String? phoneNumber,
  //   String? address,
  //   GenderEnum? gender,
  //   String? avatar,
  //   DateTime? dob,
  // }) async {
  //   final res = await _repo.updateInfo(body: {
  //     if (fullName != null) "full_name": fullName,
  //     if (phoneNumber != null) "phone_number": phoneNumber,
  //     if (address != null) "address": address,
  //     if (dob != null) "dob": DateFormat('yyyy-MM-dd').format(dob),
  //     if (gender != null) "gender": gender.name,
  //     if (avatar != null) "avatar": avatar,
  //   });
  //   return res.success == true;
  // }

  // Future<bool> sentFirebaseToken({
  //   required String token,
  // }) async {
  //   final res = await _repo.sentFirebaseToken(token: token);
  //   return res.statusCode == 200;
  // }
  //
  // Future<bool> logout() async {
  //   final res = await _repo.logout();
  //   return res.success == true;
  // }
  //
  // Future<bool> verifyPhone({
  //   required String phoneNumber,
  //   required bool isForgotPassword,
  // }) async {
  //   final res = await _repo.verifyPhone(
  //       phoneNumber: phoneNumber, isForgotPassword: isForgotPassword);
  //   return res.success == true;
  // }
  //
  // Future uploadAvatar({
  //   required File file,
  // }) async {
  //   final res = await _repo.uploadAvatar(file: file);
  //   return res.data != null ? res.data!["avatar"] : null;
  // }
}
