part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final RequestState movieDetailsRequestState;
  final MovieDetails? movieDetails;

  final String movieDetailsErrorMessage;

  final RequestState movieRecommendationsRequestState;
  final List<MovieRecommendation>? movieRecommendations;

  final String movieRecommendationsErrorMessage;

  const MovieDetailsState({
    this.movieDetailsRequestState = RequestState.isLoading,
    this.movieDetails,
    this.movieDetailsErrorMessage = '',
    this.movieRecommendations,
    this.movieRecommendationsErrorMessage = '',
    this.movieRecommendationsRequestState = RequestState.isLoading,
  });

  MovieDetailsState copyWith({
    RequestState? movieDetailsRequestState,
    MovieDetails? movieDetails,
    String? message,
    RequestState? movieRecommendationsRequestState,
    List<MovieRecommendation>? movieRecommendations,
    String? movieRecommendationsErrorMessage,
  }) {
    return MovieDetailsState(
        movieDetailsErrorMessage: message ?? movieDetailsErrorMessage,
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsRequestState:
            movieDetailsRequestState ?? this.movieDetailsRequestState,
        movieRecommendations: movieRecommendations ?? this.movieRecommendations,
        movieRecommendationsErrorMessage: movieRecommendationsErrorMessage ??
            this.movieRecommendationsErrorMessage,
        movieRecommendationsRequestState: movieRecommendationsRequestState ??
            this.movieRecommendationsRequestState);
  }

  @override
  List<Object?> get props => [
        movieDetailsRequestState,
        movieDetails,
        movieDetailsErrorMessage,
        movieRecommendationsRequestState,
        movieRecommendations,
        movieRecommendationsErrorMessage,
      ];
}
