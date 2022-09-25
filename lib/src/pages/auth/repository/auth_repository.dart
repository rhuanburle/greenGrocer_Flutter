import 'package:curso_flutter_greengrocer/src/services/http_manager.dart';
import 'package:curso_flutter_greengrocer/src/constants/endpoints.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future signIn({required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signIn,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password,
      },
    );
    if (result['result'] != null) {
      print('Sign In Success');
    } else {
      print('Sign In Error');
    }
  }
}
