import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/presentation/controller/movies_event.dart';
import 'package:movie_app/movies/presentation/controller/movies_states.dart';

import '../../domain/usecase/get_now_playing.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  GetNowPlayingUseCase getNowPlayingUseCase;
  MoviesBloc({required this.getNowPlayingUseCase}) : super(const MoviesState()) {
    on<GetNowPlayingEvent>((event, emit) async {
      final result = await getNowPlayingUseCase.execute();
      result.fold((String l) {
        emit(MoviesState(
          message: l,
          requestState: RequestState.error,
        ));
      }, (List<Movie> r) {
        emit(MoviesState(requestState: RequestState.isLoaded, movies: r));
      });
    });
  }
}
