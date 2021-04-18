import 'package:app/core/dto/company-error.dto.dart';
import 'package:app/core/dto/company-request.dto.dart';
import 'package:app/core/dto/company-response.dto.dart';
import 'package:app/core/repositories/base/network.repository.dart';
import 'package:dartz/dartz.dart';

class CompanyRepository extends NetworkRepository {
  CompanyRepository() : super();

  Future<Either<CompanyErrorDto, List<CompanyResponseDto>>> getAll(
      {CompanyRequestDto? request}) async {
    final response =
        await httpClient.get('enterprises', query: request?.asMap());

    if (response.isOk) {
      final companies = response.body['enterprises'] as List;
      return Right(
        companies.map((e) => CompanyResponseDto.fromJson(e)).toList(),
      );
    }

    return Left(CompanyErrorDto());
  }
}
