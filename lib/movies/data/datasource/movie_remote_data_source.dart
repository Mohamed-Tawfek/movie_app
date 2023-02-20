import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/movies/data/models/movie_details_model.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';
import 'package:movie_app/movies/data/models/movie_recommendation_model.dart';
import 'package:movie_app/movies/domain/entities/movie_recommendation.dart';
import 'package:movie_app/movies/domain/usecase/get_movie_details.dart';

import '../../../core/network/api_constance.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/usecase/get_movie_recommendations.dart';

abstract class BaseMovieRemoteDataSource {
  Future<Either<String, List<Movie>>> getNowPlayingMovies();

  Future<Either<String, List<Movie>>> getTopRatedMovies();

  Future<Either<String, List<Movie>>> getPopularMovies();

  Future<Either<String, MovieDetails>> getMovieDetails(
      GetMovieDetailsParams params);

  Future<Either<String, List<MovieRecommendation>>> getMovieRecommendations(
      GetMovieRecommendationsParams params);
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
      return Right((response.data['results'] as List).map((e) => MovieModel.fromJson(e)).toList());
    } else {
      return Left(response.data['status_message']);
    }
  }

  @override
  Future<Either<String, MovieDetails>> getMovieDetails(
      GetMovieDetailsParams params) async {
    try {
      final result =
          await Dio().get(ApiConstance.createMovieDetailsUrl(id: params.id));
      if (result.statusCode == 200) {
        return Right(MovieDetailsModel.fromJson(result.data));
      } else {
        return Left(result.data['status_message']);
      }
    } catch (error) {
      print('z'*50);
      print(error.toString());
      print('z'*50);
      return Left(error.toString());
    }
  }

  @override
  Future<Either<String, List<MovieRecommendation>>> getMovieRecommendations(
      GetMovieRecommendationsParams params) async {
    try {
      final result = await Dio()
          .get(ApiConstance.createMovieRecommendationsUrl(id: params.id));

      if (result.statusCode == 200) {


        return Right((result.data['results'] as List).map((e) =>
            MovieRecommendationModel.fromJson(e)).toList());



      }
      else {



        return Left(result.data['status_message']);
      }

    }catch(error){

      return Left(error.toString());

    }
  }
}
