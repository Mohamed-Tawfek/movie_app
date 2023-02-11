import 'package:dartz/dartz.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

abstract class BaseMoviesRepository{
  Future<Either<String,List<Movie>>> getNowPlaying();
  Future<Either<String,List<Movie>>> getPopularMovies();
  Future<Either<String,List<Movie>>> getTopRatedMovies();


}