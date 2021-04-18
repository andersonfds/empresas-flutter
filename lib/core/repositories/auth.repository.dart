import 'package:app/core/dto/auth-error.dto.dart';
import 'package:app/core/dto/auth-request.dto.dart';
import 'package:app/core/dto/auth-response.dto.dart';
import 'package:app/core/repositories/base/network.repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepository extends NetworkRepository {
  Future<Either<AuthErrorDto, AuthResponseDto>> login(
      AuthRequestDto requestDto) async {
    final response = await httpClient.post(
      'users/auth/sign_in',
      body: requestDto.asMap(),
    );

    if (response.isOk)
      return Right(
        AuthResponseDto(
          uid: response.headers?['uid'],
          client: response.headers?['client'],
          token: response.headers?['access-token'],
        ),
      );

    return Left(AuthErrorDto.fromJson(response.body));
  }
}
