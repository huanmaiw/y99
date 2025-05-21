class ApiRoutes {
  static const String baseUrl = 'https://loanapi.y99.vn';
// static const String baseUrl = 'https://api.y99.vn/';
  // Auth
  static const String getOtp = '$baseUrl/otp/';
  static const String verifyOtp = '$baseUrl/verify-otp/';
  static const String login = '$baseUrl/login/';
  static const String register = '$baseUrl/register/';
  static const String getPassword = '$baseUrl/password'; // + /{id}

  // User
  static const String user = '$baseUrl/data/User/';
  static String updateUser(String userId) => '$baseUrl/data-date/User/$userId/';

  // Profile
  static const String userProfile = '$baseUrl/profile/';

  // Transaction
  static const String transaction = '$baseUrl/transaction/';
  static String transactionById(String id) => '$baseUrl/transaction/$id';

  // Loan
  static const String loan = '$baseUrl/loan/';
  static String loanById(String id) => '$baseUrl/loan/$id';
}
class AppEndpoints {
  AppEndpoints._();

  static const String host = "https://api.y99.vn";

  static const String auth = "/auth";
  static const String user = "/user";
  static const String register = "/register";
  static const String login = "https://api.y99.vn";
}
