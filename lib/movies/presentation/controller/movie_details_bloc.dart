import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/movie_recommendation.dart';

import '../../domain/usecase/get_movie_details.dart';
import '../../domain/usecase/get_movie_recommendations.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  GetMovieDetailsUseCase getMovieDetails;
  GetMovieRecommendations getMovieRecommendations;

  MovieDetailsBloc(
      {required this.getMovieDetails, required this.getMovieRecommendations})
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>((event, emit) async {
      final result = await getMovieDetails(GetMovieDetailsParams(event.id));

      result.fold(
          (String l) => emit(state.copyWith(
              message: l, movieDetailsRequestState: RequestState.error)),
          (MovieDetails r) => emit(state.copyWith(
              movieDetailsRequestState: RequestState.isLoaded,
              movieDetails: r)));
    });
    on<GetRecommendationDetailsEvent>((event, emit) async {
      final result = await getMovieRecommendations(GetMovieRecommendationsParams(event.id));

      result.fold(
          (l) => emit(state.copyWith(
              movieRecommendationsRequestState: RequestState.error,
              movieRecommendationsErrorMessage: l)),
          (r) => emit(
              state.copyWith(
              movieRecommendationsRequestState: RequestState.isLoaded,
              movieRecommendations: r)));
      print('====================================================');
      print('movieDetails: ${state.movieDetails}');
      print('====================================================');
      print('movieRecommendations: ${state.movieRecommendations}');
      print('====================================================');
    });
  }
}
