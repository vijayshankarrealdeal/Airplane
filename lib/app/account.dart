import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/routes/dark_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);

    return SafeArea(
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
                          icon:
                              Icon(Icons.arrow_back, color: color.iconColor()),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          CupertinoIcons.bookmark,
                          color: color.bottomnavBarInactieIcons(),
                        ),
                        title: fonts.body1('Saved Posts', color.textColor()),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(CupertinoIcons.time,
                            color: color.bottomnavBarInactieIcons()),
                        title: fonts.body1('My Activity', color.textColor()),
                        onTap: () {},
                      ),
                      ListTile(
                          leading: Icon(CupertinoIcons.bolt,
                              color: color.bottomnavBarInactieIcons()),
                          title: fonts.body1(
                              'Your Achivements', color.textColor()),
                          onTap: () => print('todo')),
                      ListTile(
                        leading: Icon(CupertinoIcons.app_badge_fill,
                            color: color.bottomnavBarInactieIcons()),
                        title: fonts.body1('Interst', color.textColor()),
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
          body: CustomScrollView(
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
                    onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
                  )
                ],
                shadowColor: Colors.white,
                backgroundColor: color.appBarColor(),
                elevation: 0,
                title: fonts.heading5("Account", color.textColor()),
              ),
              SliverFillRemaining(
                child: Container(
                  child: fonts.heading2("Intrest", color.textColor()),
                  height: MediaQuery.of(context).size.height * 0.35,
                  color: color.interestTab(),
                ),
              ),
            ],
          )),
    );
  }
}
