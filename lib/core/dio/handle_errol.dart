// import 'dart:developer';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart' as getx;
//
// class HandleErrors extends Interceptor {
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     _logApiError(err);
//
//     final ApiError apiError = _processError(err);
//
//     // Display error message if needed
//     if (apiError.shouldShowError) {
//       AppToast.toastError(apiError.userMessage);
//     }
//
//     if (apiError.requiresOutSpace) {
//       getx.Get.find<SpaceController>().resetToPersonalSpace();
//     }
//
//     if (apiError.showDialog) {
//       showGeneralDialog(
//         context: getx.Get.context!,
//         barrierDismissible: true,
//         barrierLabel: '',
//         transitionDuration: const Duration(milliseconds: 250),
//         pageBuilder: (_, __, ___) => const SizedBox(),
//         transitionBuilder: (context, animation, secondaryAnimation, child) {
//           final curvedAnimation = CurvedAnimation(
//             parent: animation,
//             curve: Curves.easeOutBack,
//           );
//
//           return ScaleTransition(
//             scale: Tween<double>(begin: 0.8, end: 1.0).animate(curvedAnimation),
//             child: FadeTransition(
//               opacity: animation,
//               child: Dialog(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 elevation: 0,
//                 backgroundColor: Colors.transparent,
//                 child: Container(
//                   padding: const EdgeInsets.all(24),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         blurRadius: 16,
//                         offset: const Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Icon(
//                         Icons.warning_amber_rounded,
//                         color: Colors.orange,
//                         size: 48,
//                       ),
//                       const SizedBox(height: 16),
//                       const Text(
//                         'Thông báo',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//                       Text(
//                         apiError.userMessage,
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                           fontSize: 16,
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//                       ElevatedButton(
//                         onPressed: () => getx.Get.back(),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: getx.Get.theme.primaryColor,
//                           foregroundColor: Colors.white,
//                           elevation: 0,
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 32,
//                             vertical: 12,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         child: const Text(
//                           'Đóng',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//     }
//
//     // Handle authentication errors
//     if (apiError.requiresLogout) {
//       getx.Get.find<AuthController>().logout();
//     }
//
//     // Continue with error handling or transform error
//     return handler.next(err);
//   }
//
//   /// Logs API error details consistently
//   void _logApiError(DioException err) {
//     log('━━━━━━━━━━━━━━━ API ERROR ━━━━━━━━━━━━━━━');
//     log('TYPE: ${err.type}');
//     log('URL: ${err.requestOptions.uri}');
//     log('METHOD: ${err.requestOptions.method}');
//     log('HEADERS: ${err.requestOptions.headers}');
//
//     // Log request data if available
//     if (err.requestOptions.data != null) {
//       log('REQUEST DATA: ${err.requestOptions.data}');
//     }
//
//     // Log response data if available
//     if (err.response != null) {
//       log('STATUS CODE: ${err.response?.statusCode}');
//       log('RESPONSE DATA: ${err.response?.data}');
//     }
//
//     // Log any exception message
//     if (err.error != null) {
//       log('ERROR: ${err.error}');
//     }
//     log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
//   }
//
//   ApiError _processError(DioException err) {
//     switch (err.type) {
//       case DioExceptionType.connectionTimeout:
//         return ApiError(
//           type: ApiErrorType.connection,
//           userMessage: 'Connection timed out. Please try again.',
//         );
//       case DioExceptionType.sendTimeout:
//         return ApiError(
//           type: ApiErrorType.connection,
//           userMessage: 'Send timed out. Please try again.',
//         );
//       case DioExceptionType.receiveTimeout:
//         return ApiError(
//           type: ApiErrorType.connection,
//           userMessage: 'Receive timed out. Please try again.',
//         );
//       case DioExceptionType.badResponse:
//         return _handleBadResponse(err.response);
//       case DioExceptionType.cancel:
//         return ApiError(
//           type: ApiErrorType.cancelled,
//           userMessage: 'Request was cancelled',
//           shouldShowError: false,
//         );
//       case DioExceptionType.connectionError:
//         return ApiError(
//           type: ApiErrorType.connection,
//           userMessage: 'No internet connection',
//         );
//       case DioExceptionType.badCertificate:
//         return ApiError(
//           type: ApiErrorType.security,
//           userMessage: 'Security certificate issue',
//         );
//       case DioExceptionType.unknown:
//       default:
//         return ApiError(
//           type: ApiErrorType.unknown,
//           userMessage: 'Unknown error occurred',
//         );
//     }
//   }
//
//   ApiError _handleBadResponse(Response? response) {
//     final statusCode = response?.statusCode ?? 0;
//
//     // Handle authentication errors
//     if (statusCode == 403 || statusCode == 401) {
//       return ApiError(
//         type: ApiErrorType.authentication,
//         userMessage: 'You do not have permission to access this resource',
//         requiresLogout: true,
//       );
//     }
//
//     if (statusCode == 402) {
//       return ApiError(
//         type: ApiErrorType.authentication,
//         userMessage: 'You do not have permission to access this resource',
//         requiresOutSpace: true,
//       );
//     }
//
//     if (statusCode == 405) {
//       return ApiError(
//         type: ApiErrorType.authentication,
//         userMessage: _extractErrorMessage(response),
//         showDialog: true,
//       );
//     }
//
//     // Extract error message from response
//     String message = _extractErrorMessage(response);
//
//     return ApiError(
//       type: ApiErrorType.server,
//       userMessage: message,
//       statusCode: statusCode,
//     );
//   }
//
//   String _extractErrorMessage(Response? response) {
//     if (response == null) return 'Unknown error occurred';
//
//     try {
//       // Try to extract error message from various response formats
//       if (response.data is Map) {
//         return response.data['message'] ??
//             response.data['error']?.toString() ??
//             'Unknown server error';
//       }
//       return 'Server returned error status ${response.statusCode}';
//     } catch (e) {
//       return 'Failed to process error response';
//     }
//   }
// }
//
// // Structured error model to better handle APIs errors
// class ApiError {
//   final ApiErrorType type;
//   final String userMessage;
//   final bool shouldShowError;
//   final bool requiresLogout;
//   final bool showDialog;
//   final int? statusCode;
//   final bool requiresOutSpace;
//
//   ApiError({
//     required this.type,
//     required this.userMessage,
//     this.shouldShowError = true,
//     this.requiresLogout = false,
//     this.requiresOutSpace = false,
//     this.showDialog = false,
//     this.statusCode,
//   });
// }
//
// enum ApiErrorType {
//   connection,
//   server,
//   authentication,
//   cancelled,
//   security,
//   unknown,
// }
