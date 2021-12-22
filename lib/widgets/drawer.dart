import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/routes/checklist_show.dart';
import 'package:airplane/routes/dark_mode.dart';
import 'package:airplane/routes/hotels_show.dart';
import 'package:airplane/routes/login.dart';
import 'package:airplane/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetDrawer extends StatelessWidget {
  const GetDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    final auht = Provider.of<Auth>(context);

    return Drawer(
      elevation: 6,
      child: Container(
        color: color.appBarColor(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: color.iconColor()),
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HotelShow(),
                      ),
                    );
                  },
                ),
                ListTile(
                    leading: Icon(CupertinoIcons.car,
                        color: color.bottomnavBarInactieIcons()),
                    title: fonts.body1('Parking', color.textColor()),
                    onTap: () => print('todo')),
                ListTile(
                  leading: Icon(CupertinoIcons.app_badge_fill,
                      color: color.bottomnavBarInactieIcons()),
                  title: fonts.body1('Another Servies', color.textColor()),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.app_badge_fill,
                      color: color.bottomnavBarInactieIcons()),
                  title: fonts.body1('Check List', color.textColor()),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckList(),
                    ),
                  ),

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
                auht.token.isEmpty
                    ? ListTile(
                        leading: Icon(Icons.exit_to_app_rounded,
                            color: color.bottomnavBarInactieIcons()),
                        title:
                            fonts.body1('Sign in/Sign up', color.textColor()),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignIn(),
                            ),
                          );
                        },
                      )
                    : ListTile(
                        leading: Icon(Icons.exit_to_app_rounded,
                            color: color.bottomnavBarInactieIcons()),
                        title: fonts.body1('Log out', color.textColor()),
                        onTap: () {
                          auht.logout();
                          Navigator.pop(context);
                        },
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
