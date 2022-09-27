const String baseUrl = 'https://parseapi.back4app.com/functions';

abstract class Endpoints {
  static const String signUp = '$baseUrl/signUp';
  static const String signIn = '$baseUrl/login';
  static const String validateToken = '$baseUrl/validate-token';
}
