import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final String releaseDate;
  final double voteAverage;

  const Movie({required this.releaseDate,
       required this.id,
        required this.title,
        required this.backdropPath,
        required this.genreIds,
        required  this.overview,
        required  this.voteAverage,
     });

  @override
  List<Object?> get props => [
        id,
        title,
        backdropPath,
        genreIds,
        overview,
        releaseDate,
        voteAverage,
      ];
}
