import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_tractian/data/dto/company_dto.dart';
import 'package:test_tractian/data/source/network/api.dart';

class MockApi extends Mock implements Api {
  @override
  Future<List<CompanyDto>> loadCompanies() async {
    return [
      CompanyDto(id: '1', name: 'Company 1'),
      CompanyDto(id: '2', name: 'Company 2'),
    ];
  }
}

class MockResponse extends Mock implements Response {}

class MockDioClient extends Mock implements Dio {}
