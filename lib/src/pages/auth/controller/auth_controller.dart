import 'package:curso_flutter_greengrocer/src/constants/storage_keys.dart';
import 'package:curso_flutter_greengrocer/src/pages/auth/repository/auth_repository.dart';
import 'package:curso_flutter_greengrocer/src/pages/auth/result/auth_result.dart';
import 'package:curso_flutter_greengrocer/src/pages_routes/app_pages.dart';
import 'package:curso_flutter_greengrocer/src/services/utils_services.dart';
import 'package:get/get.dart';

import '../../../models/user_model.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final utilService = UltilsServices();
  final authRepository = AuthRepository();
  UserModel user = UserModel();

  @override
  void onInit() {
    super.onInit();
    // signOut()
    validateToken();
  }

  Future<void> validateToken() async {
    //Recuperar o token que foi salvo localmente
    String? token = await utilService.getLocalData(key: StorageKeys.token);

    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoute);
      return;
    }

    AuthResult result = await authRepository.validateToken(token);

    result.when(
      success: (user) {
        this.user = user;
        saveTokenAnProceedToBase();
      },
      error: (message) {
        signOut();
      },
    );
  }

  void saveTokenAnProceedToBase() {
    // Salvar Token
    utilService.saveLocalData(key: StorageKeys.token, data: user.token!);

    // Ir tela base
    Get.offAllNamed(PagesRoutes.baseRoute);
  }

  Future<void> signUp() async {
    isLoading.value = true;
    AuthResult result = await authRepository.signUp(user);
    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;
        saveTokenAnProceedToBase();
      },
      error: (message) {
        utilService.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }

  signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    AuthResult result = await authRepository.signIn(
      email: email,
      password: password,
    );

    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;
        saveTokenAnProceedToBase();
      },
      error: (message) {
        utilService.showToast(message: message, isError: true);
      },
    );
  }

  Future signOut() async {
    // Zerar  o user
    user = UserModel();

    // Remover o token localmente
    await utilService.removeLocalData(key: StorageKeys.token);

    // ir pra o login
    Get.offAllNamed(PagesRoutes.signInRoute);
  }
}
