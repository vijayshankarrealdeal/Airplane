import 'dart:ui';

import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/movie_controllers.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/routes/all_shop_route.dart';
import 'package:airplane/widgets/loading_spinner.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListenPage extends StatelessWidget {
  const ListenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieController(),
      child: Consumer3<MovieController, TypoGraphyOfApp, ColorManager>(
        builder: (context, movie, fonts, color, _) {
          return Scaffold(
            backgroundColor: color.colorofScaffold(),
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: color.appBarColor(),
                ),
                movie.bothapicalldone
                    ? SliverList(
                        delegate: SliverChildListDelegate([
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 2.0, bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                fonts.heading4("Movie", color.textColor()),
                                CupertinoButton(
                                    child:
                                        fonts.button("More", color.warning()),
                                    onPressed: () {})
                              ],
                            ),
                          ),
                          CarouselSlider.builder(
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
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 2.0, bottom: 8.0, top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                fonts.heading4("Shopping", color.textColor()),
                                CupertinoButton(
                                  child: fonts.button("More", color.warning()),
                                  onPressed: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ChangeNotifierProvider<
                                                MovieController>.value(
                                          value: movie,
                                          child: const ShoppingShowAll(),
                                        ),
                                      ),
                                    )
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: ListView.builder(
                              itemCount: movie.resultshop.length - 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    color: color.appBarColor(),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.35,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          child: Image.network(
                                            movie.resultshop[index].img,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                fonts.heading4(
                                                    movie.resultshop[index]
                                                        .title,
                                                    color.textColor()),
                                                const SizedBox(height: 10),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.15,
                                                  child: AutoSizeText(
                                                    movie.resultshop[index]
                                                        .content,
                                                    style: GoogleFonts
                                                        .sourceSansPro(
                                                            color: color
                                                                .textColor(),
                                                            fontSize: 15,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            letterSpacing: 0.5),
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                fonts.button(
                                                    movie.resultshop[index]
                                                        .opening,
                                                    color.textColor()),
                                                fonts.caption(
                                                    movie.resultshop[index]
                                                        .contanctDetails,
                                                    color.textColor()),
                                                fonts.caption(
                                                    movie.resultshop[index]
                                                        .location,
                                                    color.textColor()),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ]),
                      )
                    : const SliverFillRemaining(child: LoadingSpinner())
              ],
            ),
          );
        },
      ),
    );
  }
}
