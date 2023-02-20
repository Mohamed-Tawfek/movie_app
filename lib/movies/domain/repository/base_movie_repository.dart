import 'package:dartz/dartz.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/movie_recommendation.dart';

import '../usecase/get_movie_details.dart';
import '../usecase/get_movie_recommendations.dart';

abstract class BaseMoviesRepository {
  Future<Either<String, List<Movie>>> getNowPlaying();
  Future<Either<String, List<Movie>>> getPopularMovies();
  Future<Either<String, List<Movie>>> getTopRatedMovies();
  Future<Either<String, MovieDetails>> getMovieDetails(GetMovieDetailsParams params);
  Future<Either<String, List<MovieRecommendation>>> getMovieRecommendations(GetMovieRecommendationsParams params);
}
