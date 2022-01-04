import 'package:airplane/controllers/account_controller.dart';
import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/movie_controllers.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/model/flight_board.dart';
import 'package:airplane/widgets/loading_spinner.dart';
import 'package:airplane/widgets/show_items_tab.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FlightCheckList extends StatelessWidget {
  const FlightCheckList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: color.colorofScaffoldroute(),
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: color.backButton(), //change your color here
          ),
          backgroundColor: color.appBarColorroute(),
          bottom: TabBar(
            tabs: [
              fonts.heading6("Departure", color.textColor()),
              fonts.heading6("Arrival", color.textColor()),
            ],
          ),
        ),
        body: Consumer<AccountControllers>(
          builder: (context, dataflow, _) {
            List<FlightDashboardData> departure = dataflow.flightdetails
                .where((e) => e.isDeparture == true)
                .toList();
            List<FlightDashboardData> arrival = dataflow.flightdetails
                .where((e) => e.isDeparture == false)
                .toList();
            return dataflow.flightdetails.isEmpty
                ? const LoadingSpinner()
                : TabBarView(
                    children: [
                      ListView.builder(itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 1, vertical: 4.0),
                          child: Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            shadowColor: Colors.black,
                            color: color.homeListTile(),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: AutoSizeText(
                                          departure[index].departure,
                                          style: GoogleFonts.sourceSansPro(
                                              decoration: TextDecoration.none,
                                              color: color.textColor(),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.15),
                                        ),
                                      ),
                                      fonts.heading6(
                                        departure[index].time,
                                        color.textColor(),
                                      ),
                                      fonts.body1(
                                        departure[index].infoUrl.substring(
                                                      departure[index]
                                                              .infoUrl
                                                              .length -
                                                          6,
                                                      departure[index]
                                                          .infoUrl
                                                          .length,
                                                    )[0] ==
                                                '/'
                                            ? departure[index]
                                                .infoUrl
                                                .substring(
                                                  departure[index]
                                                          .infoUrl
                                                          .length -
                                                      5,
                                                  departure[index]
                                                      .infoUrl
                                                      .length,
                                                )
                                            : departure[index]
                                                .infoUrl
                                                .substring(
                                                  departure[index]
                                                          .infoUrl
                                                          .length -
                                                      6,
                                                  departure[index]
                                                      .infoUrl
                                                      .length,
                                                ),
                                        color.textColor(),
                                      ),
                                      fonts.heading6(
                                        departure[index].airline,
                                        color.textColor(),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          fonts.heading6(
                                            departure[index].status,
                                            color.textColor(),
                                          ),
                                          const SizedBox(width: 5),
                                          CircleAvatar(
                                            radius: 5,
                                            backgroundColor: _getcolor(
                                                departure[index].status, color),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.flight_takeoff,
                                        color: color.backButton(),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      ListView.builder(itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 1, vertical: 4.0),
                          child: Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            shadowColor: Colors.black,
                            color: color.homeListTile(),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: AutoSizeText(
                                          arrival[index].departure,
                                          style: GoogleFonts.sourceSansPro(
                                              decoration: TextDecoration.none,
                                              color: color.textColor(),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.15),
                                        ),
                                      ),
                                      fonts.heading6(
                                        arrival[index].time,
                                        color.textColor(),
                                      ),
                                      fonts.body1(
                                        arrival[index].infoUrl.substring(
                                                      arrival[index]
                                                              .infoUrl
                                                              .length -
                                                          6,
                                                      arrival[index]
                                                          .infoUrl
                                                          .length,
                                                    )[0] ==
                                                '/'
                                            ? arrival[index].infoUrl.substring(
                                                  arrival[index]
                                                          .infoUrl
                                                          .length -
                                                      5,
                                                  arrival[index].infoUrl.length,
                                                )
                                            : arrival[index].infoUrl.substring(
                                                  arrival[index]
                                                          .infoUrl
                                                          .length -
                                                      6,
                                                  arrival[index].infoUrl.length,
                                                ),
                                        color.textColor(),
                                      ),
                                      fonts.heading6(
                                        arrival[index].airline,
                                        color.textColor(),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          fonts.heading6(
                                            arrival[index].status,
                                            color.textColor(),
                                          ),
                                          const SizedBox(width: 5),
                                          CircleAvatar(
                                            radius: 5,
                                            backgroundColor: _getcolor(
                                                arrival[index].status, color),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.flight_land,
                                        color: color.nowarning(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  );
          },
        ),
      ),
    );
  }

  _getcolor(String status, ColorManager color) {
    if (status.contains('Delayed')) {
      return color.orange();
    }
    if (status.contains('On-time')) {
      return color.nowarning();
    }
    if (status.contains('Unknown')) {
      return color.warning();
    }
    if (status.contains('Scheduled')) {
      return color.purple();
    }

    if (status.contains('Canceled')) {
      return color.warning();
    }
    if (status.contains('En Route')) {
      return color.yellow();
    }
  }
}
