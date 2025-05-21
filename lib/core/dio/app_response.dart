import 'package:json_annotation/json_annotation.dart';

part 'app_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  final T? data;
  final String? message;
  final bool? success;
  final int statusCode;

  ApiResponse({
    required this.data,
    required this.message,
    required this.statusCode,
    required this.success,
  });

  factory ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);

  @override
  String toString() {
    return 'ApiResponse{data: $data, message: $message, success: $success, statusCode: $statusCode}';
  }
}
