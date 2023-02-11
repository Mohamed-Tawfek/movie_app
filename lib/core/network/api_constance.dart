class ApiConstance {
  static const baseUrl = 'api.themoviedb.org/3/';
  static const apiKey = 'c3435cfe40aeb079689227d82bf921d3';
  static const nowPlayingMoviesPath = '${baseUrl}movie/now_playing?api_key=$apiKey';
  static const popularMoviesPath = '${baseUrl}movie/popular?api_key=$apiKey';
  static const topRatedMoviesPath = '${baseUrl}movie/top_rated?api_key=$apiKey';
}
