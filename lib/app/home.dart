import 'dart:ui';

import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/movie_controllers.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/routes/all_shop_route.dart';
import 'package:airplane/routes/login.dart';
import 'package:airplane/services/auth.dart';
import 'package:airplane/widgets/drawer.dart';
import 'package:airplane/widgets/loading_spinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> pp = ["Flight", "Hotels", "Transport", "Shopping"];
    List<String> px = ["Res", "Enmt", "Serv ", "Infp"];
    List<String> tx = [
      "flight - status",
      "deals -offer",
      "travel-checklist ",
      "Your Trips"
    ];
    final font = Provider.of<TypoGraphyOfApp>(context);
    final auth = Provider.of<Auth>(context);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return ChangeNotifierProvider(
      create: (context) => MovieController(),
      child: Consumer3<MovieController, TypoGraphyOfApp, ColorManager>(
        builder: (context, movie, fonts, color, _) {
          return Scaffold(
            drawer: const GetDrawer(),
            key: _scaffoldKey,
            backgroundColor: color.colorofScaffold(),
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  // flexibleSpace: Container(
                  //   width: double.infinity,
                  //   decoration: const BoxDecoration(
                  //       image: DecorationImage(
                  //           fit: BoxFit.cover,
                  //           image: CachedNetworkImageProvider(
                  //               'https://images.pexels.com/photos/8971702/pexels-photo-8971702.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'))),
                  // ),
                  backgroundColor: color.appBarColor(),
                  leading: IconButton(
                    icon: Icon(CupertinoIcons.hammer),
                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                  actions: [
                    auth.token.isEmpty
                        ? CupertinoButton(
                            color: color.buttonOutside(),
                            child: font.button("Sign In", color.buttonInside()),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (conetxt) => const SignIn()));
                            })
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  font.body1("Username", color.textColor()),
                                  font.body1("BlrCoin", color.textColor()),
                                ],
                              ),
                              const SizedBox(width: 10),
                              const SizedBox(
                                height: 40,
                                width: 40,
                                child: Icon(Icons.payment),
                              ),
                            ],
                          ),
                  ],
                ),

                ///1
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: color.appBarColorroute(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      height: MediaQuery.of(context).size.width * 0.3,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: pp
                              .map(
                                (e) => Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundColor: color.interestTab(),
                                    ),
                                    font.subTitle1(
                                      e,
                                      color.textColor(),
                                    )
                                  ],
                                ),
                              )
                              .toList()),
                    ),
                  ),
                ),

                ///2
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: color.appBarColorroute(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      height: MediaQuery.of(context).size.width * 0.3,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: px
                              .map(
                                (e) => Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundColor: color.interestTab(),
                                    ),
                                    font.subTitle1(
                                      e,
                                      color.textColor(),
                                    )
                                  ],
                                ),
                              )
                              .toList()),
                    ),
                  ),
                ),

                ///3
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: color.appBarColorroute(),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 65,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: tx
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Container(
                                    width: 140,
                                    decoration: BoxDecoration(
                                      color: color.appBarColorroute(),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child:
                                          font.heading6(e, color.textColor()),
                                    ),
                                  ),
                                ),
                              )
                              .toList()),
                    ),
                  ),
                ),
                movie.load && movie.resultshop.isNotEmpty
                    ? SliverList(
                        delegate: SliverChildListDelegate([
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12.0, bottom: 8.0, top: 8.0),
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
                            height: MediaQuery.of(context).size.height * 0.26,
                            child: ListView.builder(
                              itemCount: movie.resultshop.length - 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: color.appBarColor(),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    width: MediaQuery.of(context).size.width *
                                        0.86,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 13.0, vertical: 3),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          fonts.heading5(
                                              movie.resultshop[index].title,
                                              color.textColor()),

                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
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

                                          // SizedBox(
                                          //   width: MediaQuery.of(context)
                                          //           .size
                                          //           .width *
                                          //       0.9,
                                          //   child: Padding(
                                          //     padding:
                                          //         const EdgeInsets.all(8.0),
                                          //     child: Column(
                                          //       mainAxisAlignment:
                                          //           MainAxisAlignment.start,
                                          //       crossAxisAlignment:
                                          //           CrossAxisAlignment.start,
                                          //       children: [

                                          //         const SizedBox(height: 10),
                                          //         SizedBox(
                                          //           height:
                                          //               MediaQuery.of(context)
                                          //                       .size
                                          //                       .height *
                                          //                   0.15,
                                          //           child: AutoSizeText(
                                          //             movie.resultshop[index]
                                          //                 .content,
                                          //             style: GoogleFonts
                                          //                 .sourceSansPro(
                                          //                     color: color
                                          //                         .textColor(),
                                          //                     fontSize: 15,
                                          //                     decoration:
                                          //                         TextDecoration
                                          //                             .none,
                                          //                     fontWeight:
                                          //                         FontWeight
                                          //                             .w400,
                                          //                     letterSpacing:
                                          //                         0.5),
                                          //           ),
                                          //         ),

                                          //       ],
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.only(left: 2.0, bottom: 8.0),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       fonts.heading4("Movie", color.textColor()),
                          //       CupertinoButton(
                          //           child:
                          //               fonts.button("More", color.warning()),
                          //           onPressed: () {})
                          //     ],
                          //   ),
                          // ),
                          // CarouselSlider.builder(
                          //   itemCount: movie.result.length - 5,
                          //   itemBuilder: (BuildContext context, int itemIndex,
                          //           int pageViewIndex) =>
                          //       Stack(
                          //     children: [
                          //       Container(
                          //         decoration: BoxDecoration(
                          //           image: DecorationImage(
                          //               image: NetworkImage(
                          //                 'http://image.tmdb.org/t/p/w500' +
                          //                     movie.result[itemIndex].posterPath
                          //                         .toString(),
                          //               ),
                          //               fit: BoxFit.fitHeight),
                          //         ),
                          //       ),
                          //       Center(
                          //         child: ClipRRect(
                          //           child: BackdropFilter(
                          //             filter: ImageFilter.blur(
                          //                 sigmaX: 1.5, sigmaY: 1.5),
                          //             child: Container(
                          //               width:
                          //                   MediaQuery.of(context).size.width,
                          //               height:
                          //                   MediaQuery.of(context).size.height,
                          //               decoration: BoxDecoration(
                          //                   color:
                          //                       Colors.black.withOpacity(0.5)),
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(8.0),
                          //                 child: Column(
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.center,
                          //                   crossAxisAlignment:
                          //                       CrossAxisAlignment.center,
                          //                   children: [
                          //                     fonts.heading2(
                          //                         movie.result[itemIndex]
                          //                                 .title ??
                          //                             '',
                          //                         Colors.white),
                          //                     fonts.heading1(
                          //                         movie.result[itemIndex]
                          //                             .voteAverage
                          //                             .toString(),
                          //                         Colors.white)
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          //   options: CarouselOptions(
                          //       aspectRatio: 3 / 4,
                          //       initialPage: 0,
                          //       enableInfiniteScroll: true,
                          //       reverse: false,
                          //       autoPlay: true,
                          //       autoPlayInterval: const Duration(seconds: 3),
                          //       scrollDirection: Axis.horizontal,
                          //       height:
                          //           MediaQuery.of(context).size.height * 0.65),
                          // ),
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
