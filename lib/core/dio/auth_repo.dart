import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'api/app_endpoint.dart';
import 'app_response.dart';
import 'errol_logger.dart';
part 'auth_repo.g.dart';

@RestApi()
abstract class AuthRepo {
  factory AuthRepo(Dio dio) = _AuthRepo;

  @POST('${AppEndpoints.auth}/login')
  Future<ApiResponse> login({
    @Field('username') required String username,
    @Field('password') required String password,
  });

  @POST('${AppEndpoints.auth}/logout')
  Future<ApiResponse> logout();

  @POST('${AppEndpoints.auth}/verify-email')
  Future<ApiResponse> verifyEmail({
    @Field('email') required String email,
    @Field('is_forgot_password') bool? isForgotPassword,
  });

  @POST('${AppEndpoints.auth}/register')
  Future<ApiResponse> register({
    @Field('full_name') required String fullName,
    @Field('phone_number') String? phoneNumber,
    @Field('password') required String password,
    @Field('email') String? email,
  });

  // @POST('${AppEndpoints.auth}/confirm-email')
  // Future<ApiResponse> confirmEmail({
  //   @Field('email') required String email,
  //   @Field('code') required String code,
  //   @Field('is_forgot_password') bool? isForgotPassword,
  // });

  // @POST('${AppEndpoints.auth}/change-password')
  // Future<ApiResponse> changePassword({
  //   @Field('old_password') required String oldPassword,
  //   @Field('new_password') required String password,
  // });

  // @POST('${AppEndpoints.auth}/forget-password')
  // Future<ApiResponse> forgotPassword({
  //   @Field('phone_number') String? phoneNumber,
  //   @Field('email') String? email,
  //   @Field('new_password') required String password,
  // });

  // @POST('${AppEndpoints.auth}/sent-firebase-token')
  // Future<ApiResponse> sentFirebaseToken({
  //   @Field('firebase_token') required String token,
  // });
  //
  // @GET('${AppEndpoints.auth}/info')
  // Future<ApiResponse<Profile>> getInfo();

  // @PUT("${AppEndpoints.auth}/update-info")
  // Future<ApiResponse> updateInfo({
  //   @Body() required Map<String, dynamic> body,
  // });


  @POST('${AppEndpoints.auth}/verify-phone')
  Future<ApiResponse> verifyPhone({
    @Field('phone_number') required String phoneNumber,
    @Field('is_forgot_password') bool? isForgotPassword,
  });
}
