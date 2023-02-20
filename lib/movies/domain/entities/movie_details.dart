import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetails extends Equatable {
  final String  backdropPath;
  final int id;
  final String title;
  final String overview;
  final double voteAverage;
  final int runtime;
  final String releaseDate;
  final List<Genres> genres;

  const MovieDetails(
      {  required this.backdropPath,
      required this.id,
      required this.genres,
      required this.title,
      required this.overview,
      required this.voteAverage,
      required this.runtime,
      required this.releaseDate});

  @override
  List<Object> get props => [
        backdropPath,
        genres,
        id,
        title,
        overview,
        voteAverage,
        runtime,
        releaseDate,
      ];
}
