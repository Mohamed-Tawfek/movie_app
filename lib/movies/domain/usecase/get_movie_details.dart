import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/base_usecase.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';

import '../repository/base_movie_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails, GetMovieDetailsParams> {
  BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<String, MovieDetails>> call(
      GetMovieDetailsParams params) async {
    return await baseMoviesRepository.getMovieDetails(params);
  }
}

class GetMovieDetailsParams extends Equatable {
  final int id;

  const GetMovieDetailsParams(this.id);

  @override
  List<Object?> get props => [];
}
