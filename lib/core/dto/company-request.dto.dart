class CompanyRequestDto {
  String? name;

  CompanyRequestDto({this.name});

  Map<String, dynamic>? asMap() {
    if (name?.isNotEmpty != true) return null;
    return {'name': name};
  }
}
