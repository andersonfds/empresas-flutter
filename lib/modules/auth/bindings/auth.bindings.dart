import 'package:app/modules/auth/controllers/auth.controller.dart';
import 'package:get/get.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
