// import 'dart:developer';
//
// import 'package:dio/dio.dart';
// import 'package:get_storage/get_storage.dart';
//
// class CookieManager extends Interceptor {
//   final GetStorage _storage;
//
//   CookieManager(this._storage);
//
//   @override
//   Future<void> onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     final cookies = _getCookies();
//     final spaceId = _getSpaceId();
//     if (cookies.isNotEmpty) {
//       options.headers['Cookie'] = cookies;
//     }
//     if (spaceId.isNotEmpty) {
//       options.headers['spaceid'] = spaceId;
//     }
//     return handler.next(options);
//   }
//
//   @override
//   Future<void> onResponse(
//       Response response, ResponseInterceptorHandler handler) async {
//     final cookies = response.headers['set-cookie'];
//     if (cookies != null && cookies.isNotEmpty) {
//       _saveCookies(cookies);
//     }
//     final body = response.data;
//     if (body != null && body['data'] != null) {
//       final data = body['data'];
//       if (data is Map &&
//           data.containsKey('space_id') &&
//           data['space_id'] != null) {
//         _storage.write(
//             PreferenceKey.currentSpaceId, data['space_id'].toString());
//       }
//     }
//     return handler.next(response);
//   }
//
//   String _getCookies() {
//     String cookie =
//         '${_storage.read(PreferenceKey.accessToken) ?? ''};${_storage.read(PreferenceKey.refreshToken) ?? ''}';
//     return cookie != ';' ? cookie : '';
//   }
//
//   String _getSpaceId() {
//     return _storage.read(PreferenceKey.currentSpaceId) ?? '';
//   }
//
//   void _saveCookies(List<String> cookies) {
//     for (var cookie in cookies) {
//       if (cookie.contains('access_token=')) {
//         _storage.write(PreferenceKey.accessToken, cookie);
//       } else if (cookie.contains('refresh_token=')) {
//         _storage.write(PreferenceKey.refreshToken, cookie);
//       }
//     }
//   }
// }
