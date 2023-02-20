import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movies/domain/usecase/get_popular_movies.dart';
import 'package:movie_app/movies/domain/usecase/get_top_rated_movies.dart';

import '../../movies/data/datasource/movie_remote_data_source.dart';
import '../../movies/domain/usecase/get_movie_details.dart';
import '../../movies/domain/usecase/get_movie_recommendations.dart';
import '../../movies/domain/usecase/get_now_playing.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// USE CASES
    sl.registerLazySingleton<GetNowPlayingUseCase>(
        () => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton<GetPopularMoviesUseCase>(
        () => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton<GetTopRatedMoviesUseCase>(
        () => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton<GetMovieDetailsUseCase>(
        () => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton<GetMovieRecommendations>(
        () => GetMovieRecommendations(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    /// REPOSITORIES
    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(sl()));
  }
}
