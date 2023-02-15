class ApiConstance {
  static const baseUrl = 'https://api.themoviedb.org/3/';
  static const apiKey = 'c3435cfe40aeb079689227d82bf921d3';
  static const nowPlayingMoviesPath = '${baseUrl}movie/now_playing?api_key=$apiKey';
  static const popularMoviesPath = '${baseUrl}movie/popular?api_key=$apiKey';
  static const topRatedMoviesPath = '${baseUrl}movie/top_rated?api_key=$apiKey';
  static const imageBaseUrl='https://image.tmdb.org/t/p/w500';
  static String createImageUrl({required String path})=>'$imageBaseUrl$path';
}
