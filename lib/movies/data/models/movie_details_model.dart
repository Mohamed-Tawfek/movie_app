import 'package:movie_app/movies/domain/entities/genres.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.id,
      required super.genres,
      required super.title,
      required super.overview,
      required super.voteAverage,
      required super.runtime,
      required super.releaseDate});
  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'],
        overview: json['overview'],
        backdropPath: json['backdrop_path'],
        title: json['title'],
        id:json['id'],
        genres: List<Genres>.from(json['genres'].map((e) => Genres(id: e['id'], name: e['name']))) ,
        runtime: json['runtime']);
  }
}
