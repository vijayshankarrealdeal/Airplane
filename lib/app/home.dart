import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/movie_controllers.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/routes/all_moive_route.dart';
import 'package:airplane/routes/all_shop_route.dart';
import 'package:airplane/routes/buses.dart';
import 'package:airplane/routes/deals_offer_ui.dart';
import 'package:airplane/routes/flightchecklist.dart';
import 'package:airplane/routes/food_pre_post.dart';
import 'package:airplane/routes/hotels_show.dart';
import 'package:airplane/routes/infos.dart';
import 'package:airplane/routes/login.dart';
import 'package:airplane/routes/qr.dart';
import 'package:airplane/routes/serach_for_airplances.dart';
import 'package:airplane/routes/services.dart';
import 'package:airplane/routes/support_help.dart';
import 'package:airplane/routes/your_trips.dart';
import 'package:airplane/services/auth.dart';
import 'package:airplane/widgets/drawer.dart';
import 'package:airplane/widgets/loading_spinner.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> ppImage = [
      "assets/images/tk.png",
      "assets/images/hto.png",
      "assets/images/trans.png",
      "assets/images/shop.png",
    ];
    List<String> pp = ["Flight", "Hotels", "Transport", "Shopping"];
    List<String> px = [
      "Restaurants",
      "Entertainment",
      " Your Trips ",
      "   Info   "
    ];

    List<String> pxImage = [
      "assets/images/food.png",
      "assets/images/music.png",
      "assets/images/trips.png",
      "assets/images/info.png",
    ];
    List<String> tx = [
      "Flight Status",
      "Deals & Offers",
      "Services",
      "Support"
    ];
    final font = Provider.of<TypoGraphyOfApp>(context);
    final auth = Provider.of<Auth>(context);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Consumer3<MovieController, TypoGraphyOfApp, ColorManager>(
      builder: (context, movie, fonts, color, _) {
        return Scaffold(
          drawer: const GetDrawer(),
          key: _scaffoldKey,
          backgroundColor: color.colorofScaffold(),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
                title: font.heading5("Flight+", color.textColor()),
                // fltexibleSpace: Container(
                //   width: double.infinity,
                //   decoration: const BoxDecoration(
                //       image: DecorationImage(
                //           fit: BoxFit.cover,
                //           image: CachedNetworkImageProvider(
                //               'https://images.pexels.com/photos/8971702/pexels-photo-8971702.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'))),
                // ),
                backgroundColor: color.appBarColor(),
                leading: IconButton(
                  icon: Icon(FontAwesomeIcons.bars, color: color.textColor()),
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                ),
                actions: [
                  auth.accesstoken.isEmpty
                      ? CupertinoButton(
                          child: font.button("Sign In", color.textColor()),
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
                            const SizedBox(width: 10),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: IconButton(
                                icon: Icon(Icons.qr_code,
                                    color: color.textColor()),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const QRViewExample(),
                                    ),
                                  );
                                },
                              ),
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
                                  GestureDetector(
                                    child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage(ppImage[pp.indexOf(e)]),
                                      radius: 40,
                                      backgroundColor: Colors.white,
                                    ),
                                    onTap: () {
                                      if (e == "Flight") {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SearchForAirplanes(),
                                          ),
                                        );
                                      }
                                      if (e == "Shopping") {
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
                                        );
                                      }

                                      if (e == 'Hotels') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const HotelShow(),
                                          ),
                                        );
                                      }
                                      if (e.contains('Transport')) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const BuList(),
                                          ),
                                        );
                                      }
                                    },
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
                                  GestureDetector(
                                    child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage(pxImage[px.indexOf(e)]),
                                      radius: 40,
                                      backgroundColor: Colors.white,
                                    ),
                                    onTap: () {
                                      if (e == 'Entertainment') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ChangeNotifierProvider<
                                                    MovieController>(
                                              create: (xtc) =>
                                                  MovieController(),
                                              child: const MoreMovies(),
                                            ),
                                          ),
                                        );
                                      }
                                      if (e.contains("Restaurants")) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ChangeNotifierProvider<
                                                    MovieController>.value(
                                              value: movie,
                                              child: const FoodPrePost(),
                                            ),
                                          ),
                                        );
                                      }
                                      if (e.contains("Your Trips")) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const YourTrips(),
                                          ),
                                        );
                                      }
                                      if (e.contains('Info')) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const InfoList(),
                                          ),
                                        );
                                      }
                                    },
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
                              (e) => GestureDetector(
                                onTap: () {
                                  if (e.contains("Flight Status")) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const FlightCheckList(),
                                      ),
                                    );
                                  }

                                  if (e == "Deals & Offers") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const OffersDeals(),
                                      ),
                                    );
                                  }

                                  if (e.contains('Services')) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ServiceList(),
                                      ),
                                    );
                                  }
                                  if (e.contains("Support")) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SupportAndHelp(),
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  width: 140,
                                  decoration: BoxDecoration(
                                    color: color.appBarColorroute(),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: font.heading6(e, color.textColor()),
                                  ),
                                ),
                              ),
                            )
                            .toList()),
                  ),
                ),
              ),
              movie.load &&
                      movie.resultshop.isNotEmpty &&
                      movie.resultfood.isNotEmpty
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
                                child: fonts.button(
                                    "More", color.labeledButtonoutside()),
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
                          child: CarouselSlider.builder(
                            options: CarouselOptions(
                                aspectRatio: 3 / 4,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 5),
                                scrollDirection: Axis.horizontal,
                                height:
                                    MediaQuery.of(context).size.height * 0.65),
                            itemCount: movie.resultshop.length - 10,
                            itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) {
                              return Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: color.appBarColor(),
                                      borderRadius: BorderRadius.circular(25)),
                                  width:
                                      MediaQuery.of(context).size.width * 0.86,
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
                                            movie.resultshop[itemIndex].title,
                                            color.textColor()),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            fonts.button(
                                                movie.resultshop[itemIndex]
                                                    .opening,
                                                color.textColor()),
                                            fonts.caption(
                                                movie.resultshop[itemIndex]
                                                    .contanctDetails,
                                                color.textColor()),
                                            fonts.caption(
                                                movie.resultshop[itemIndex]
                                                    .location,
                                                color.textColor()),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, bottom: 8.0, top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              fonts.heading4("Food", color.textColor()),
                              CupertinoButton(
                                child: fonts.button(
                                    "More", color.labeledButtonoutside()),
                                onPressed: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ChangeNotifierProvider<
                                              MovieController>.value(
                                        value: movie,
                                        child: const FoodPrePost(),
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
                          child: CarouselSlider.builder(
                            options: CarouselOptions(
                                aspectRatio: 3 / 4,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 5),
                                scrollDirection: Axis.horizontal,
                                height:
                                    MediaQuery.of(context).size.height * 0.65),
                            itemCount: movie.resultfood.length - 5,
                            itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) {
                              return Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: color.appBarColor(),
                                      borderRadius: BorderRadius.circular(25)),
                                  width:
                                      MediaQuery.of(context).size.width * 0.86,
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
                                            movie.resultfood[itemIndex].title,
                                            color.textColor()),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            fonts.button(
                                                movie.resultfood[itemIndex]
                                                    .opening,
                                                color.textColor()),
                                            fonts.caption(
                                                movie.resultfood[itemIndex]
                                                    .contanctDetails,
                                                color.textColor()),
                                            fonts.caption(
                                                movie.resultfood[itemIndex]
                                                    .location,
                                                color.textColor()),
                                          ],
                                        ),
                                      ],
                                    ),
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
    );
  }
}
