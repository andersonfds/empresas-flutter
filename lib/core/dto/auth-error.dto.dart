class AuthErrorDto {
  String? message;

  AuthErrorDto({this.message});

  factory AuthErrorDto.fromJson(Map<String, dynamic> json) {
    return AuthErrorDto(
      message: (json['errors'] as List<dynamic>).first?.toString(),
    );
  }
}
