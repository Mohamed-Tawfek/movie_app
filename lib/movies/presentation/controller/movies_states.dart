import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingRequestState;
  final String nowPlayingRequestMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedRequestState;
  final String topRatedRequestMessage;
  final List<Movie> popularMovies;
  final RequestState popularRequestState;
  final String popularRequestMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingRequestState = RequestState.isLoading,
    this.nowPlayingRequestMessage = '',
    this.popularMovies = const [],
    this.popularRequestState = RequestState.isLoading,
    this.popularRequestMessage = '',
    this.topRatedMovies = const [],
    this.topRatedRequestState = RequestState.isLoading,
    this.topRatedRequestMessage = '',
  });
  MoviesState copyWith({
    final List<Movie>? nowPlayingMovies,
    final RequestState? nowPlayingRequestState,
    final String? nowPlayingRequestMessage,
    final List<Movie>? topRatedMovies,
    final RequestState? topRatedRequestState,
    final String? topRatedRequestMessage,
    final List<Movie>? popularMovies,
    final RequestState? popularRequestState,
    final String? popularRequestMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingRequestMessage:
          nowPlayingRequestMessage ?? this.nowPlayingRequestMessage,
      nowPlayingRequestState:
          nowPlayingRequestState ?? this.nowPlayingRequestState,
      popularMovies: popularMovies ?? this.popularMovies,
      popularRequestMessage:
          popularRequestMessage ?? this.popularRequestMessage,
      popularRequestState: popularRequestState ?? this.popularRequestState,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedRequestMessage:
          topRatedRequestMessage ?? this.topRatedRequestMessage,
      topRatedRequestState: topRatedRequestState ?? this.topRatedRequestState,
    );
  }

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingRequestState,
        nowPlayingRequestMessage,
        topRatedMovies,
        topRatedRequestState,
        topRatedRequestMessage,
        popularMovies,
        popularRequestState,
        popularRequestMessage
      ];
}
