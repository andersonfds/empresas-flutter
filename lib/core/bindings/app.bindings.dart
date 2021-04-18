import 'package:app/core/repositories/auth.repository.dart';
import 'package:app/core/repositories/company.repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<GetStorage>(GetStorage());
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<CompanyRepository>(() => CompanyRepository());
  }
}
