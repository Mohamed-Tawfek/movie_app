import 'package:dio/dio.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/api_constance.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw ServerError(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
