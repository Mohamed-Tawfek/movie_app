abstract class MoviesEvent {}


class GetNowPlayingEvent extends MoviesEvent{}

class GetPopularMoviesEvent extends MoviesEvent{}

class GetTopRatedMoviesEvent extends MoviesEvent{}
