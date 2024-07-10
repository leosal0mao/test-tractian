import 'package:flutter/material.dart';
import 'package:test_tractian/presentation/pages/asset_page/view/asset_page.dart';
import 'package:test_tractian/presentation/pages/home_page/view/home_page.dart';

final routes = {
  '/': (context) => const HomePage(),
  '/assets': (context) {
    final companyId = ModalRoute.of(context)?.settings.arguments as String;
    return AssetPage(companyId: companyId);
  }
};
