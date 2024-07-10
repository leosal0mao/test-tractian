import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tractian/dependency_injection.dart';
import 'package:test_tractian/presentation/constants/colors.dart';
import 'package:test_tractian/presentation/routes.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: getIt,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tractian',
        routes: routes,
        theme: ThemeData(
          fontFamily: 'Roboto',
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.deepBlue,
          ),
        ),
      ),
    );
  }
}
