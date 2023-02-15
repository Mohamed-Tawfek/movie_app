import 'package:dartz/dartz.dart';
import 'package:movie_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';


class MovieRepository extends BaseMoviesRepository{
  BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<String, List<Movie>>> getNowPlaying() {
   return baseMovieRemoteDataSource.getNowPlayingMovies();
  }

  @override
  Future<Either<String, List<Movie>>> getPopularMovies() {
    return baseMovieRemoteDataSource.getPopularMovies();

  }

  @override
  Future<Either<String, List<Movie>>> getTopRatedMovies() {
    return baseMovieRemoteDataSource.getTopRatedMovies();

  }


}