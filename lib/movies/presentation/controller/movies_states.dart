import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> movies;
  final RequestState requestState;
  final String message;

  const MoviesState(
      {this.movies = const [],
      this.requestState = RequestState.isLoading,
      this.message = ''});

  @override
  List<Object> get props => [movies, requestState, message];
}
