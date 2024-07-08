import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_tractian/data/dto/asset_dto.dart';
import 'package:test_tractian/data/dto/company_dto.dart';
import 'package:test_tractian/data/dto/location_dto.dart';
import 'package:test_tractian/data/source/local/local_storage.dart';

const cachedCompanyId = 'CACHED_COMPANY_ID';
const cachedCompanyListKey = 'CACHED_COMPANY_LIST';
const cachedAssetListKey = 'CACHED_ASSET_LIST';
const cachedLocationListKey = 'CACHED_LOCATION_LIST';

class LocalStorageImpl implements LocalStorage {
  final SharedPreferences _sharedPreferences;

  LocalStorageImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  @visibleForTesting
  static String getCompanyId(String companyId) {
    return '${cachedCompanyId}_$companyId';
  }

  @override
  List<CompanyDto> loadCompanies() {
    const key = cachedCompanyListKey;
    final jsonList = _sharedPreferences.getStringList(key);

    return jsonList != null
        ? jsonList.map((e) => CompanyDto.fromRawJson(e)).toList()
        : [];
  }

  @override
  List<AssetDto> loadAssets(String companyId) {
    const key = cachedAssetListKey;
    final jsonList = _sharedPreferences.getStringList(key);

    return jsonList != null
        ? jsonList.map((e) => AssetDto.fromRawJson(e)).toList()
        : [];
  }

  @override
  List<LocationDto> loadLocations(String companyId) {
    const key = cachedLocationListKey;
    final jsonList = _sharedPreferences.getStringList(key);

    return jsonList != null
        ? jsonList.map((e) => LocationDto.fromRawJson(e)).toList()
        : [];
  }

  @override
  Future<bool> saveCompanies({required List<CompanyDto> list}) {
    final jsonList = list.map((e) => e.toRawJson()).toList();
    return _sharedPreferences.setStringList(cachedCompanyListKey, jsonList);
  }

  @override
  Future<bool> saveAssets(
      {required List<AssetDto> list, required String companyId}) {
    final jsonList = list.map((e) => e.toRawJson()).toList();
    final key = getCompanyId(companyId);
    return _sharedPreferences.setStringList(key, jsonList);
  }

  @override
  Future<bool> saveLocations(
      {required List<LocationDto> list, required String companyId}) {
    final jsonList = list.map((e) => e.toRawJson()).toList();
    final key = getCompanyId(companyId);
    return _sharedPreferences.setStringList(key, jsonList);
  }
}
