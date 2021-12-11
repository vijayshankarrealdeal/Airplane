import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/planepage_controllers.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/model/plane.dart';
import 'package:airplane/routes/airplane_watchlist.dart';
import 'package:airplane/widgets/show_airplane_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer3<PlaneControllers, TypoGraphyOfApp, ColorManager>(
      builder: (ctx, data, fonts, colors, _) {
        return Scaffold(
          backgroundColor: colors.colorofScaffold(),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
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
                            color: colors.iconColor(),
                            size: 35,
                          )),
                    ],
                  )
                ],
                backgroundColor: colors.appBarColor(),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
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
                          IconButton(
                            padding: EdgeInsets.zero,
                            color: colors.interestTab(),
                            onPressed: () => data.selectDate(context),
                            icon: const Icon(
                              CupertinoIcons.calendar,
                            ),
                          ),
                          fonts.body1(data.pickedDate, colors.textColor()),
                        ],
                      ),
                      data.load
                          ? CupertinoButton(
                              color: colors.buttonOutside(),
                              onPressed: () => data.call(
                                  data.originfrom.text.toLowerCase(),
                                  data.destto.text.toLowerCase(),
                                  data.pickedDate,
                                  1,
                                  0,
                                  0),
                              child: fonts.subTitle1(
                                  "Search", colors.buttonInside()),
                            )
                          : CircularProgressIndicator(
                              color: colors.textColor(),
                            )
                    ],
                  ),
                ])),
              ),
              data.flight.isEmpty
                  ? SliverFillRemaining(
                      child: Center(
                        child: data.load
                            ? fonts.heading1("Welcome", colors.textColor())
                            : fonts.heading1(
                                data.error.isNotEmpty
                                    ? data.error
                                    : data.searchdone
                                        ? "No Flights"
                                        : "Searching",
                                colors.textColor(),
                              ),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => ChangeNotifierProvider<Data>.value(
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
