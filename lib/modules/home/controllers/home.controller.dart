import 'package:app/core/dto/company-error.dto.dart';
import 'package:app/core/dto/company-request.dto.dart';
import 'package:app/core/dto/company-response.dto.dart';
import 'package:app/core/repositories/company.repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with StateMixin<List<CompanyResponseDto>> {
  final CompanyRepository _companyRepository = Get.find();

  @override
  void onInit() {
    super.onInit();
    loadCompanies(null);
  }

  void onSuccess(List<CompanyResponseDto> companies) {
    if (companies.isEmpty)
      change(null, status: RxStatus.empty());
    else
      change(companies, status: RxStatus.success());
  }

  void onError(CompanyErrorDto error) {
    change(null, status: RxStatus.error());
  }

  loadCompanies(CompanyRequestDto? request) async {
    change(null, status: RxStatus.loading());
    final companies = await _companyRepository.getAll(request: request);
    companies.fold(onError, onSuccess);
  }

  void onSearch(String? text) {
    final searchReq = CompanyRequestDto(name: text);
    loadCompanies(searchReq);
  }
}
