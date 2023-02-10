import 'package:movie_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel(super.id, super.title, super.backdropPath, super.genreIds,
      super.overview, super.voteAverage, super.releaseDate);
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      json['id'],
      json['title'],
      json['backdrop_path'],
      json['genre_ids'],
      json['overview'],
      json['vote_average'],
      json['release_date'],
    );
  }
}
