import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_tractian/dependency_injection.dart';
import 'package:test_tractian/presentation/app_root.dart';

late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  initApp();
  runApp(const AppRoot());
}
