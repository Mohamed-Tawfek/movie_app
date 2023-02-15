import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

import '../../movies/data/datasource/movie_remote_data_source.dart';
import '../../movies/domain/usecase/get_now_playing.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// USE CASES
    sl.registerLazySingleton<GetNowPlayingUseCase>(
        () => GetNowPlayingUseCase(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    /// REPOSITORIES
    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(sl()));
  }
}
