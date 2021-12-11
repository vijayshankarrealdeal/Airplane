import 'dart:ui';

import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/movie_controllers.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListenPage extends StatelessWidget {
  const ListenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => MovieController(),
        child: Consumer3<MovieController, TypoGraphyOfApp, ColorManager>(
          builder: (context, movie, fonts, color, _) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: color.appBarColor(),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    fonts.heading6("Movie", color.textColor()),
                    movie.result.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : CarouselSlider.builder(
                            itemCount: movie.result.length - 5,
                            itemBuilder: (BuildContext context, int itemIndex,
                                    int pageViewIndex) =>
                                Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          'http://image.tmdb.org/t/p/w500' +
                                              movie.result[itemIndex].posterPath
                                                  .toString(),
                                        ),
                                        fit: BoxFit.fitHeight),
                                  ),
                                ),
                                Center(
                                  child: ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 1.5, sigmaY: 1.5),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.5)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              fonts.heading2(
                                                  movie.result[itemIndex]
                                                          .title ??
                                                      '',
                                                  Colors.white),
                                              fonts.heading1(
                                                  movie.result[itemIndex]
                                                      .voteAverage
                                                      .toString(),
                                                  Colors.white)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            options: CarouselOptions(
                                aspectRatio: 3 / 4,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 3),
                                scrollDirection: Axis.horizontal,
                                height:
                                    MediaQuery.of(context).size.height * 0.65),
                          ),
                    fonts.heading6("Shopping", color.textColor()),
                    movie.resultshop.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : SizedBox(
                            height: 400,
                            child: ListView.builder(
                                itemCount: movie.resultshop.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        height: 200,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                movie.resultshop[index].img
                                                    .toString(),
                                              ),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      fonts.body1(movie.resultshop[index].text,
                                          color.textColor())
                                    ],
                                  );
                                }),
                          )
                  ]),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}















// .builder(
//             // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//             //   maxCrossAxisExtent: 200,
//             //   childAspectRatio: 3 / 4,
//             // ),
//             itemCount: movie.result.length,
//             itemBuilder: (context, index) {
//               var data = movie.result[index];
//               return AspectRatio(
//                 aspectRatio: 1.5,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: NetworkImage(
//                           'http://image.tmdb.org/t/p/w500' +
//                               data.backdropPath.toString(),
//                         ),
//                         fit: BoxFit.cover),
//                   ),
//                 ),
//               );
//             },
//           );