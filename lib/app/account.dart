import 'package:airplane/controllers/account_controller.dart';
import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/widgets/drawer.dart';
import 'package:airplane/widgets/form.dart';
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
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: FormForApp(
                          callback: () =>
                              dataFlow.getSearch(dataFlow.controller.text),
                          change: (s) => dataFlow.getSearch(s),
                          email: dataFlow.controller,
                          placeholder: "Search Your Flight",
                        ),
                      ),
                    ]),
                  ),
                  dataFlow.flightdetails.isNotEmpty
                      ? SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            var _data = dataFlow.controller.text.isEmpty
                                ? dataFlow.flightdetails[index]
                                : dataFlow.searchyourf[index];
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: AutoSizeText(
                                              _data.departure,
                                              style: GoogleFonts.sourceSansPro(
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: color.textColor(),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.15),
                                            ),
                                          ),
                                          fonts.heading6(
                                            _data.time,
                                            color.textColor(),
                                          ),
                                          fonts.body1(
                                            _data.infoUrl.substring(
                                                      _data.infoUrl.length - 6,
                                                      _data.infoUrl.length,
                                                    )[0] ==
                                                    '/'
                                                ? _data.infoUrl.substring(
                                                    _data.infoUrl.length - 5,
                                                    _data.infoUrl.length,
                                                  )
                                                : _data.infoUrl.substring(
                                                    _data.infoUrl.length - 6,
                                                    _data.infoUrl.length,
                                                  ),
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
                                            backgroundColor:
                                                _getcolor(_data.status, color),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                              childCount: dataFlow.controller.text.isEmpty
                                  ? dataFlow.flightdetails.length
                                  : dataFlow.searchyourf.length),
                        )
                      : const SliverFillRemaining(
                          child: LoadingSpinner(),
                        ),
                ],
              );
            },
          )),
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
