import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/usecase/get_popular_movies.dart';
import 'package:movie_app/movies/domain/usecase/get_top_rated_movies.dart';
import 'package:movie_app/movies/presentation/controller/movies_event.dart';
import 'package:movie_app/movies/presentation/controller/movies_states.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utils/base_usecase.dart';
import '../../domain/usecase/get_now_playing.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  GetNowPlayingUseCase getNowPlayingUseCase;
  GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  GetPopularMoviesUseCase getPopularMoviesUseCase;
  MoviesBloc(
      {required this.getNowPlayingUseCase,
      required this.getPopularMoviesUseCase,
      required this.getTopRatedMoviesUseCase})
      : super(const MoviesState()) {
    on<GetNowPlayingEvent>(_getNowPlayingMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);
  }

  FutureOr<void> _getNowPlayingMovies(event, emit) async {
    await getNowPlayingUseCase(const NoParams()).then((final result) {
      result.fold((String l) {
        emit(state.copyWith(
          nowPlayingRequestMessage: l,
          nowPlayingRequestState: RequestState.error,
        ));
      }, (List<Movie> r) {
        emit(state.copyWith(
            nowPlayingRequestState: RequestState.isLoaded,
            nowPlayingMovies: r));
      });
    }).catchError((onError) {
      emit(state.copyWith(
        nowPlayingRequestMessage: onError.toString(),
        nowPlayingRequestState: RequestState.error,
      ));
    });
  }

  FutureOr<void> _getTopRatedMovies(event, emit) async {
    await getTopRatedMoviesUseCase(const NoParams()).then((final result) {
      result.fold((String l) {
        emit(state.copyWith(
          topRatedRequestMessage: l,
          topRatedRequestState: RequestState.error,
        ));
      }, (List<Movie> r) {
        emit(state.copyWith(
            topRatedRequestState: RequestState.isLoaded, topRatedMovies: r));
      });
    }).catchError((onError) {
      emit(state.copyWith(
        topRatedRequestMessage: onError.toString(),
        topRatedRequestState: RequestState.error,
      ));
    });
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    await getPopularMoviesUseCase(const NoParams()).then((final result) {
      result.fold((String l) {
        emit(state.copyWith(
          popularRequestMessage: l,
          popularRequestState: RequestState.error,
        ));
      }, (List<Movie> r) {
        emit(state.copyWith(
            popularRequestState: RequestState.isLoaded, popularMovies: r));
      });
    }).catchError((onError) {
      emit(state.copyWith(
        popularRequestMessage: onError.toString(),
        popularRequestState: RequestState.error,
      ));
    });
  }
}
