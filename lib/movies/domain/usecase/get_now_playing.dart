import 'package:dartz/dartz.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

import '../entities/movie.dart';

class GetNowPlaying{
  BaseMoviesRepository baseMoviesRepository;

  GetNowPlaying(this.baseMoviesRepository);
  Future<Either<String,List<Movie>>> execute()async{
   return await baseMoviesRepository.getNowPlaying();
  }
}