import 'dart:convert';

import 'package:test_tractian/domain/entities/company.dart';

class CompanyDto extends Company {
  CompanyDto({
    super.id,
    super.name,
  });

// Json conversion
  factory CompanyDto.fromRawJson(String str) =>
      CompanyDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

// Maps
  factory CompanyDto.fromMap(Map<String, dynamic> json) => CompanyDto(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };

// Domain
  static CompanyDto fromLocation(Company company) {
    return CompanyDto(
      id: company.id,
      name: company.name,
    );
  }

  Company toCompany() {
    return Company(
      id: id,
      name: name,
    );
  }
}
