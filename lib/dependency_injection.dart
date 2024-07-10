import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_tractian/data/company_repository_impl.dart';
import 'package:test_tractian/data/source/local/local_storage.dart';
import 'package:test_tractian/data/source/local/local_storage_impl.dart';
import 'package:test_tractian/data/source/network/api.dart';
import 'package:test_tractian/data/source/network/api_impl.dart';
import 'package:test_tractian/domain/repositories/company_repository.dart';
import 'package:test_tractian/domain/repositories/location_repository.dart';
import 'package:test_tractian/domain/usecases/get_all_companies.dart';
import 'package:test_tractian/domain/usecases/get_assets.dart';
import 'package:test_tractian/domain/usecases/get_locations.dart';
import 'package:test_tractian/main.dart';
import 'package:test_tractian/presentation/pages/home_page/bloc/home_page_bloc.dart';

import 'data/asset_repository_impl.dart';
import 'data/location_repository_impl.dart';
import 'domain/repositories/asset_repository.dart';

GetIt getIt = GetIt.instance;

Future<void> initApp() async {
  getIt.registerFactory<Dio>(() => Dio());

  // DATA layer
  getIt.registerLazySingleton<Api>(() => ApiImpl(dio: getIt()));

  getIt.registerFactory<LocalStorage>(
      () => LocalStorageImpl(sharedPreferences: sharedPreferences));

  getIt.registerFactory<CompanyRepository>(
      () => CompanyRepositoryImpl(api: getIt(), localStorage: getIt()));

  getIt.registerFactory<LocationRepository>(
      () => LocationRepositoryImpl(api: getIt(), localStorage: getIt()));

  getIt.registerFactory<AssetRepository>(
      () => AssetRepositoryImpl(api: getIt(), localStorage: getIt()));

  // DOMAIN layer
  getIt.registerFactory(() => GetAllCompanies(repository: getIt()));
  getIt.registerFactory(() => GetAssets(repository: getIt()));
  getIt.registerFactory(() => GetLocations(repository: getIt()));

  // PRESENTATION layer

  getIt.registerFactory<HomePageBloc>(
      () => HomePageBloc(getAllCompanies: getIt()));
}
