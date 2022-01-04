import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/planepage_controllers.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/model/plane.dart';
import 'package:airplane/routes/airplane_watchlist.dart';
import 'package:airplane/services/auth.dart';
import 'package:airplane/widgets/loading_spinner.dart';
import 'package:airplane/widgets/show_airplane_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchForAirplanes extends StatelessWidget {
  const SearchForAirplanes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer4<PlaneControllers, TypoGraphyOfApp, ColorManager, Auth>(
      builder: (context, data, fonts, colors, user, _) {
        return Scaffold(
          backgroundColor: colors.colorofScaffold(),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
                title: fonts.heading5("Flights", colors.textColor()),
                iconTheme: IconThemeData(
                  color: colors.backButton(), //change your color here
                ),
                elevation: 0,
                actions: [
                  Stack(
                    children: [
                      Positioned(
                        top: 22,
                        right: 9,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: colors.interestTab(),
                          child: fonts.body1(data.watchLish.length.toString(),
                              colors.textColor()),
                        ),
                      ),
                      IconButton(
                          onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChangeNotifierProvider<
                                          PlaneControllers>.value(
                                      value: data,
                                      child: const AirplaneWatchList()),
                                ),
                              ),
                          icon: Icon(
                            CupertinoIcons.bag,
                            color: colors.textColor(),
                            size: 35,
                          )),
                    ],
                  )
                ],
                backgroundColor: colors.appBarColor(),
              ),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                sliver: SliverList(
                    delegate: SliverChildListDelegate([
                  Theme(
                    data: ThemeData(
                        brightness: colors.darkmode
                            ? Brightness.dark
                            : Brightness.light),
                    child: TypeAheadField(
                        suggestionsBoxDecoration: SuggestionsBoxDecoration(
                            elevation: 2, color: colors.appBarColor()),
                        textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                              prefix: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 7.0, vertical: 2),
                                child: Icon(CupertinoIcons.location_fill,
                                    color: colors.iconColor(), size: 15),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: colors.textColor()),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: colors.textColor()),
                              ),
                              hintText: "From",
                              hintStyle: GoogleFonts.sourceSansPro(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.4,
                                color: colors.formPlaceholder(),
                              ),
                            ),
                            controller: data.originfrom),
                        suggestionsCallback: (pattern) async {
                          return await data.returnSuggestion(pattern);
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: fonts.body1(
                                suggestion.toString(), colors.textColor()),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          data.onsuggestionselect(suggestion.toString());
                        }),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    child: GestureDetector(
                      onTap: () => data.changethelines(),
                      child: CircleAvatar(
                        backgroundColor:
                            colors.colorofScaffoldroute().withOpacity(0.2),
                        radius: 12,
                        child: Icon(
                          CupertinoIcons.arrow_up_arrow_down,
                          color: colors.textColor(),
                        ),
                      ),
                    ),
                  ),
                  Theme(
                    data: ThemeData(
                        brightness: colors.darkmode
                            ? Brightness.dark
                            : Brightness.light),
                    child: TypeAheadField(
                        suggestionsBoxDecoration: SuggestionsBoxDecoration(
                            elevation: 2, color: colors.appBarColor()),
                        textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                              prefix: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 7.0, vertical: 2),
                                child: Icon(CupertinoIcons.location,
                                    color: colors.iconColor(), size: 15),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: colors.textColor()),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: colors.textColor()),
                              ),
                              hintText: "To",
                              hintStyle: GoogleFonts.sourceSansPro(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.4,
                                color: colors.formPlaceholder(),
                              ),
                            ),
                            controller: data.destto),
                        suggestionsCallback: (pattern) async {
                          return await data.returnSuggestion(pattern);
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: fonts.body1(
                                suggestion.toString(), colors.textColor()),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          data.onsuggestionselect2(suggestion.toString());
                        }),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () => data.selectDate(context),
                            child: Icon(
                              CupertinoIcons.calendar,
                              color: colors.backButton(),
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                          fonts.body1(data.pickedDate, colors.textColor()),
                        ],
                      ),
                      data.load
                          ? CupertinoButton(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              color: colors.buttonOutside(),
                              onPressed: () => data.call(
                                  data.originfrom.text.toLowerCase(),
                                  data.destto.text.toLowerCase(),
                                  data.pickedDate,
                                  1,
                                  0,
                                  0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(CupertinoIcons.search,
                                      color: colors.orange()),
                                  fonts.subTitle1(
                                      "Search", colors.buttonInside()),
                                ],
                              ),
                            )
                          : const LoadingSpinner(
                              addText: false,
                            ),
                    ],
                  ),
                ])),
              ),
              data.flight.isEmpty
                  ? SliverFillRemaining(
                      child: Center(
                        child: data.load
                            ? fonts.heading4("Let the journey begin",
                                colors.formPlaceholder())
                            : fonts.heading4(
                                data.error.isNotEmpty
                                    ? data.error
                                    : data.searchdone
                                        ? "No Flights"
                                        : "Searching",
                                colors.formPlaceholder(),
                              ),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) =>
                            ChangeNotifierProvider<FlightData>.value(
                          value: data.flight[index],
                          child: const ShowAirPlaneCards(),
                        ),
                        childCount: data.flight.length,
                      ),
                    )
            ],
          ),
        );
      },
    );
  }
}
