import 'package:flutter/material.dart';

import 'core/services/services_locator.dart';
import 'core/utils/app_strings.dart';
import 'movies/presentation/screens/movies_screen.dart';

void main() async {
  ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainMoviesScreen(),
    );
  }
}
