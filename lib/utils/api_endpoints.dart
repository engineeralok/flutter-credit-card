class ApiEndPoints {
  static const String baseUrl = "https://interview-api.onrender.com/v1/";
  static AuthEndPoints authEndPoints = AuthEndPoints();
}

class AuthEndPoints {
  final String registerEmail = "auth/register";
  final String loginEmail = "auth/login";
  final String addNewCard = "cards";
}
