import 'package:airplane/controllers/account_controller.dart';
import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/routes/dark_mode.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);

    return SafeArea(
      child: ChangeNotifierProvider<AccountControllers>(
        create: (context) => AccountControllers(),
        child: Scaffold(
            backgroundColor: color.colorofScaffold(),
            key: _scaffoldKey,
            endDrawer: Drawer(
              elevation: 0,
              child: Container(
                color: color.drawerColor(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back,
                                color: color.iconColor()),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            CupertinoIcons.bookmark,
                            color: color.bottomnavBarInactieIcons(),
                          ),
                          title: fonts.body1('Your Trips', color.textColor()),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(CupertinoIcons.time,
                              color: color.bottomnavBarInactieIcons()),
                          title: fonts.body1('Hotels', color.textColor()),
                          onTap: () {},
                        ),
                        ListTile(
                            leading: Icon(CupertinoIcons.car,
                                color: color.bottomnavBarInactieIcons()),
                            title: fonts.body1('Parking', color.textColor()),
                            onTap: () => print('todo')),
                        ListTile(
                          leading: Icon(CupertinoIcons.app_badge_fill,
                              color: color.bottomnavBarInactieIcons()),
                          title:
                              fonts.body1('Another Servies', color.textColor()),
                          onTap: () {},
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ListTile(
                          leading: Icon(CupertinoIcons.settings_solid,
                              color: color.bottomnavBarInactieIcons()),
                          title: fonts.body1('Settings', color.textColor()),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Settings(),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.exit_to_app_rounded,
                              color: color.bottomnavBarInactieIcons()),
                          title: fonts.body1('Log out', color.textColor()),
                          onTap: () => print('todo'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.blue.shade900,
                                  ),
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
                        : SliverFillRemaining(
                            child: Center(
                                child: CircularProgressIndicator(
                              color: color.textColor(),
                            )),
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
  if (status.contains('En Route')) {
    return color.yellow();
  }
}
