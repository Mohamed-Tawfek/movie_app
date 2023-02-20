import 'package:movie_app/movies/domain/entities/movie_recommendation.dart';

class MovieRecommendationModel extends MovieRecommendation {
  const MovieRecommendationModel(super.id, super.backdropPath);

  factory MovieRecommendationModel.fromJson(Map<String, dynamic> json) {

    return MovieRecommendationModel(json['id'], json['backdrop_path']??'/hQ4pYsIbP22TMXOUdSfC2mjWrO0.jpg');
  }
}
