import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/base_usecase.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

import '../entities/movie.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>,NoParams>{
  BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<String, List<Movie>>> call(NoParams params)async {
return await baseMoviesRepository.getTopRatedMovies();
  }

}
