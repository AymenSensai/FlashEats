class ApiConstants {
  static const String apiBaseUrl = "http://192.168.1.5:8000/";

  static const String login = "auth/login";
  static const String signup = "auth/register";
  static const String food = "food/index";
  static const String showFood = "food/show";
  static const String popularFood = "food/popular";
  static const String favorites = "user/favorites";
  static const String containsFavorite = "user/favorites/contains";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
