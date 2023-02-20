part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent{
 final int id;

 const GetMovieDetailsEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class GetRecommendationDetailsEvent extends MovieDetailsEvent{
  final int id;

  const GetRecommendationDetailsEvent(this.id);

  @override
  List<Object?> get props => [id];
}
