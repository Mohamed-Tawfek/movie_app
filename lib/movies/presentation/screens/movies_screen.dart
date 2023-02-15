import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/movies/domain/usecase/get_now_playing.dart';
import 'package:movie_app/movies/presentation/component/top_rated_movie_component.dart';
import 'package:movie_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movie_app/movies/presentation/controller/movies_states.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constance.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/dummy.dart';
import '../component/now_playing_component.dart';
import '../component/popular_movies_component.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          MoviesBloc(getNowPlayingUseCase: sl<GetNowPlayingUseCase>()),
      child: BlocBuilder<MoviesBloc,MoviesState>(
          builder: (_, state) => Scaffold(
                backgroundColor: Colors.black,
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  key: const Key('movieScrollView'),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const NowPlayingComponent(),
                      Container(
                        margin:
                            const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Popular",
                              style: GoogleFonts.poppins(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.15,
                                  color: Colors.white),
                            ),
                            InkWell(
                              onTap: () {
                                /// TODO : NAVIGATION TO POPULAR SCREEN
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: const [
                                    Text(
                                      'See More',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Icon(Icons.arrow_forward_ios,
                                        size: 16.0, color: Colors.white)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const GetPopularMovieComponent(),
                      Container(
                        margin: const EdgeInsets.fromLTRB(
                          16.0,
                          24.0,
                          16.0,
                          8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Top Rated",
                              style: GoogleFonts.poppins(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.15,
                                  color: Colors.white),
                            ),
                            InkWell(
                              onTap: () {
                                /// TODO : NAVIGATION TO Top Rated Movies Screen
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: const [
                                    Text(
                                      'See More',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Icon(Icons.arrow_forward_ios,
                                        size: 16.0, color: Colors.white)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const TopRatedMovieComponent(),
                      const SizedBox(height: 50.0),
                    ],
                  ),
                ),
              )),
    );
  }
}
