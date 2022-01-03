import 'package:airplane/controllers/account_controller.dart';
import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/widgets/loading_spinner.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HotelShow extends StatelessWidget {
  const HotelShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    return Scaffold(
      backgroundColor: color.colorofScaffoldroute(),
      body: Consumer<AccountControllers>(
        builder: (context, data, _) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
                title: fonts.heading5("Hotel", color.textColor()),
                iconTheme: IconThemeData(
                  color: color.backButton(), //change your color here
                ),
                backgroundColor: color.appBarColorroute(),
                actions: [
                  data.hoteldetails.isNotEmpty
                      ? CupertinoButton(
                          child: Icon(
                            Icons.sort,
                            color: color.backButton(),
                          ),
                          onPressed: () =>
                              showPopModelSheet(context, fonts, color),
                        )
                      : const SizedBox(),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CupertinoButton(
                            child: const Icon(CupertinoIcons.macwindow),
                            onPressed: () => data.incomedate(context),
                          ),
                          fonts.body1(data.pickedDate, color.textColor())
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CupertinoButton(
                            child:
                                const Icon(CupertinoIcons.calendar_badge_plus),
                            onPressed: () => data.outdate(context),
                          ),
                          fonts.body1(data.endate, color.textColor())
                        ],
                      ),
                      data.load
                          ? CupertinoButton(
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.search,
                                      color: color.orange()),
                                  fonts.button("Search", color.textColor()),
                                ],
                              ),
                              onPressed: () =>
                                  data.hotelcall(data.pickedDate, data.endate),
                            )
                          : const LoadingSpinner(addText: false),
                    ],
                  ),
                ]),
              ),
              data.hoteldetails.isNotEmpty
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          var _hotels = data.hoteldetails[index];
                          var _hotelname = _hotels.hotelName
                              .substring(1, _hotels.hotelName.length - 1)
                              .split(',')[0];
                          var _name =
                              _hotelname.substring(1, _hotelname.length - 1);
                          return Card(
                            color: color.colorofCardShowing(),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: CachedNetworkImageProvider(
                                              _hotels.img,
                                            ),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.33,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.25,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                _name.length > 21
                                                    ? _name.substring(0, 21) +
                                                        ".."
                                                    : _name,
                                                style:
                                                    GoogleFonts.sourceSansPro(
                                                        color:
                                                            color.textColor(),
                                                        fontSize: 28,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        letterSpacing: 0.15),
                                              ),
                                              fonts.subTitle1(_hotels.rating,
                                                  color.textColor()),
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.02),
                                              fonts.subTitle1(_hotels.distance,
                                                  color.textColor()),
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.002),
                                              fonts.heading6(
                                                _hotels.price,
                                                color.textColor(),
                                              ),
                                              fonts.caption(_hotels.tax,
                                                  color.textColor()),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: data.hoteldetails.length,
                      ),
                    )
                  : SliverFillRemaining(
                      child: Center(
                        child: fonts.heading4(
                          data.load
                              ? "Plan your next staycation"
                              : "Looking for your stay",
                          color.formPlaceholder(),
                        ),
                      ),
                    )
            ],
          );
        },
      ),
    );
  }

  void showPopModelSheet(
      BuildContext context, TypoGraphyOfApp fonts, ColorManager color) {
    showBottomSheet(
      context: context,
      builder: (context) {
        return Consumer<AccountControllers>(
          builder: (ctx, data, _) {
            return Container(
              color: color.appBarColorroute(),
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView(
                children: [
                  Container(width: double.infinity),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        CupertinoIcons.clear,
                      ),
                    ),
                  ),
                  // ListTile(
                  //   title: fonts.body1(
                  //       "Sort By High to Low Amount", color.textColor()),
                  //   onTap: () {
                  //     data.sortbylowtohighamount();
                  //     Navigator.pop(context);
                  //   },
                  // ),
                  // ListTile(
                  //   title: fonts.body1(
                  //       "Sort By Low to Hogh Amount", color.textColor()),
                  //   onTap: () {
                  //     data.sortbyhightolowamount();
                  //     Navigator.pop(context);
                  //   },
                  // ),
                  // ListTile(
                  //   title:
                  //       fonts.body1("Sort By Far Distance", color.textColor()),
                  //   onTap: () {
                  //     data.sortbydistance();
                  //     Navigator.pop(context);
                  //   },
                  // ),
                  // ListTile(
                  //   title:
                  //       fonts.body1("Sort By Near Distance", color.textColor()),
                  //   onTap: () {
                  //     data.sortbylowdistance();
                  //     Navigator.pop(context);
                  //   },
                  // ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
