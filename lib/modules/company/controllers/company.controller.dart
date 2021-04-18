import 'package:app/core/dto/company-response.dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CompanyController extends GetxController {
  Rx<CompanyResponseDto?> company = Rx(null);

  @override
  void onInit() {
    super.onInit();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
    final arguments = Get.arguments;
    if (arguments is CompanyResponseDto) {
      company.value = arguments;
    }
  }

  @override
  void onClose() {
    super.onClose();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));
  }
}
