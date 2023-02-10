import 'package:dio/dio.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';

class MovieRemoteDataSource{
Future <List<MovieModel>> getNowPlayingMovies()async{

final response=await Dio().get('api.themoviedb.org/3/movie/now_playing?api_key=c3435cfe40aeb079689227d82bf921d3');

 if(response.statusCode==200){
   return (response.data['results'] as List ).map((e) => MovieModel.fromJson(
     e
   )).toList();
 }
 else{
   return [];
 }
}




}