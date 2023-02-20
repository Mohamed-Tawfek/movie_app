import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/base_usecase.dart';
import 'package:movie_app/movies/domain/entities/movie_recommendation.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class GetMovieRecommendations extends BaseUseCase<List<MovieRecommendation>,
    GetMovieRecommendationsParams> {
  BaseMoviesRepository baseMoviesRepository;

  GetMovieRecommendations(this.baseMoviesRepository);

  @override
  Future<Either<String, List<MovieRecommendation>>> call(
      GetMovieRecommendationsParams params) async {
   return await baseMoviesRepository.getMovieRecommendations(params);
  }
}

class GetMovieRecommendationsParams extends Equatable {
  final int id;

  const GetMovieRecommendationsParams(this.id);

  @override
  List<Object?> get props => [id];
}
