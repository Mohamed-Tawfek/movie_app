import 'package:flutter/material.dart';
import 'package:movie_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/domain/usecase/get_now_playing.dart';
import 'core/services/services_locator.dart';
import 'movies/domain/usecase/get_popular_movies.dart';
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
      title: 'Movies App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainMoviesScreen(),
    );
  }
}
