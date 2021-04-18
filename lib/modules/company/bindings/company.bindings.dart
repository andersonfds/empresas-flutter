import 'package:app/modules/company/controllers/company.controller.dart';
import 'package:get/get.dart';

class CompanyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CompanyController());
  }
}
