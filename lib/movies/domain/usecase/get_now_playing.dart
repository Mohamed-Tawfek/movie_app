import 'package:dartz/dartz.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

import '../../../core/utils/base_usecase.dart';
import '../entities/movie.dart';

class GetNowPlayingUseCase extends BaseUseCase<List<Movie>,NoParams> {
  BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingUseCase(this.baseMoviesRepository);

  @override
  Future<Either<String, List<Movie>>> call(NoParams params) async {
    return await baseMoviesRepository.getNowPlaying();
  }
}
