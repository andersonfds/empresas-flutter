import 'package:app/core/dto/auth-error.dto.dart';
import 'package:app/core/dto/auth-request.dto.dart';
import 'package:app/core/dto/auth-response.dto.dart';
import 'package:app/core/repositories/auth.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final GetStorage box = Get.find();
  AuthRepository _authRepository = Get.find();
  // Observables
  Rx<AuthRequestDto> authRequest = Rx(AuthRequestDto());
  Rx<String?> error = Rx<String?>(null);
  RxBool isValid = false.obs;
  RxBool isLoading = false.obs;
  RxBool passwordVisible = true.obs;

  // Text Controllers
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  String? validateEmail(String? email) {
    if (email?.isNotEmpty != true) return 'Campo obrigatório';
    if (email?.isEmail != true) return 'Não é um e-mail válido';
    return null;
  }

  String? validatePassword(String? password) {
    if (password?.isNotEmpty != true) return 'Campo obrigatório';
    return null;
  }

  void setEmail(String? email) {
    this.authRequest.update((val) => val?.email = email);
  }

  void switchPasswordVisibility() {
    this.passwordVisible.value = !this.passwordVisible.value;
  }

  void setPassword(String? password) {
    this.authRequest.update((val) => val?.password = password);
  }

  void onSuccess(AuthResponseDto auth) {
    box.write('accessToken', auth.token);
    box.write('client', auth.client);
    box.write('uid', auth.uid);
    Get.offAllNamed('home');
  }

  void onFailure(AuthErrorDto error) {
    this.error.value = error.message;
  }

  Future<void> onLogin() async {
    this.error.value = null;
    this.isLoading.value = true;
    final response = await _authRepository.login(authRequest.value);
    this.isLoading.value = false;
    // handling response
    response.fold(onFailure, onSuccess);
  }
}
