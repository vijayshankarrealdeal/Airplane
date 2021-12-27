import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/routes/another_services.dart';
import 'package:airplane/routes/checklist_show.dart';
import 'package:airplane/routes/maps.dart';
import 'package:airplane/routes/settings.dart';
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
                    CupertinoIcons.location_fill,
                    color: color.bottomnavBarInactieIcons(),
                  ),
                  title: fonts.body1('Navigations', color.textColor()),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MapsAndLocation(),
                    ),
                  ),
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
                ListTile(
                    leading: Icon(CupertinoIcons.chat_bubble_2,
                        color: color.bottomnavBarInactieIcons()),
                    title: fonts.body1('Customer Support', color.textColor()),
                    onTap: () => print('todo')),
              ],
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(CupertinoIcons.info,
                      color: color.bottomnavBarInactieIcons()),
                  title: fonts.body1('About Us', color.textColor()),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnotherServices(),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.phone,
                      color: color.bottomnavBarInactieIcons()),
                  title: fonts.body1('Contact Us', color.textColor()),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnotherServices(),
                    ),
                  ),
                ),
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
