class ApiEndPoints {
  static final String baseUrl = "https://interview-api.onrender.com/v1/";
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = "auth/register";
  final String loginEmail = "auth/login";
}
