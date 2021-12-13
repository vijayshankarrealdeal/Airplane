import 'package:airplane/controllers/account_controller.dart';
import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/routes/dark_mode.dart';
import 'package:airplane/widgets/drawer.dart';
import 'package:airplane/widgets/loading_spinner.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
      child: ChangeNotifierProvider<AccountControllers>(
        create: (context) => AccountControllers(),
        child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: color.colorofScaffold(),
            endDrawer: const GetDrawer(),
            body: Consumer<AccountControllers>(
              builder: (context, dataFlow, _) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      iconTheme: IconThemeData(
                        color: color.textColor(), //change your color here
                      ),
                      actions: [
                        CupertinoButton(
                          child: Icon(
                            CupertinoIcons.cube,
                            color: color.iconColor(),
                          ),
                          onPressed: () =>
                              _scaffoldKey.currentState!.openEndDrawer(),
                        )
                      ],
                      shadowColor: Colors.white,
                      backgroundColor: color.appBarColor(),
                      elevation: 0,
                      title: fonts.heading5("Account", color.textColor()),
                    ),
                    dataFlow.flightdetails.isNotEmpty
                        ? SliverList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                              var _data = dataFlow.flightdetails[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Card(
                                  elevation: 6,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  shadowColor: Colors.black,
                                  color: color.homeListTile(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.45,
                                              child: AutoSizeText(
                                                _data.departure,
                                                style:
                                                    GoogleFonts.sourceSansPro(
                                                        decoration:
                                                            TextDecoration.none,
                                                        color:
                                                            color.textColor(),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        letterSpacing: 0.15),
                                              ),
                                            ),
                                            fonts.heading6(
                                              _data.time,
                                              color.textColor(),
                                            ),
                                            fonts.heading6(
                                              _data.airline,
                                              color.textColor(),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            fonts.heading6(
                                              _data.status,
                                              color.textColor(),
                                            ),
                                            const SizedBox(width: 5),
                                            CircleAvatar(
                                              radius: 5,
                                              backgroundColor: _getcolor(
                                                  _data.status, color),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }, childCount: dataFlow.flightdetails.length),
                          )
                        : const SliverFillRemaining(
                            child: LoadingSpinner(),
                          ),
                  ],
                );
              },
            )),
      ),
    );
  }
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
