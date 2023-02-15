import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';


import '../../../core/network/api_constance.dart';
import '../../domain/entities/movie.dart';

abstract class BaseMovieRemoteDataSource {
  Future<Either<String, List<Movie>>> getNowPlayingMovies();
  Future<Either<String, List<Movie>>> getTopRatedMovies();
  Future<Either<String, List<Movie>>> getPopularMovies();
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {

  @override
  Future<Either<String, List<Movie>>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return Right((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList());
    } else {
      return Left(response.data['status_message']);
    }
  }

  @override
  Future<Either<String, List<Movie>>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);

    if (response.statusCode == 200) {
      return Right((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList());
    } else {
      return Left(response.data['status_message']);
    }
  }

  @override
  Future<Either<String, List<Movie>>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return Right((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList());
    } else {
      return Left(response.data['status_message']);
    }
  }
}
