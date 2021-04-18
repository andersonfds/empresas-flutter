import 'package:get/get.dart';

class AuthRequestDto {
  String? email;
  String? password;

  AuthRequestDto({
    this.email,
    this.password,
  });

  bool get isValid => email?.isEmail == true && password?.isNotEmpty == true;

  Map<String, dynamic> asMap() => {
        'email': email,
        'password': password,
      };
}
