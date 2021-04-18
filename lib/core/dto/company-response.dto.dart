class CompanyResponseDto {
  int? id;
  String? enterpriseName;
  String? description;
  String? emailEnterprise;
  String? facebook;
  String? twitter;
  String? linkedin;
  String? phone;
  bool? ownEnterprise;
  String? photo;
  int? value;
  int? shares;
  double? sharePrice;
  int? ownShares;
  String? city;
  String? country;

  CompanyResponseDto({
    this.id,
    this.enterpriseName,
    this.description,
    this.emailEnterprise,
    this.facebook,
    this.twitter,
    this.linkedin,
    this.phone,
    this.ownEnterprise,
    this.photo,
    this.value,
    this.shares,
    this.sharePrice,
    this.ownShares,
    this.city,
    this.country,
  });
  // String? enterpriseType;
  //
  factory CompanyResponseDto.fromJson(Map<String, dynamic> json) {
    return CompanyResponseDto(
      id: json['id'],
      enterpriseName: json['enterprise_name'],
      description: json['description'],
      emailEnterprise: json['email_enterprise'],
      facebook: json['facebook'],
      twitter: json['twitter'],
      linkedin: json['linkedin'],
      phone: json['phone'],
      ownEnterprise: json['own_enterprise'],
      photo: json['photo'],
      value: json['value'],
      shares: json['shares'],
      sharePrice: json['share_price'],
      ownShares: json['own_shares'],
      city: json['city'],
      country: json['country'],
    );
  }
}
