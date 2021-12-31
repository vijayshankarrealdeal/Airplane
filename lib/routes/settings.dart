import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/location_controller.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/services/auth.dart';
import 'package:airplane/widgets/form.dart';
import 'package:airplane/widgets/loading_spinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _newpass = TextEditingController();
    TextEditingController _confpass = TextEditingController();
    TextEditingController _currpassword = TextEditingController();

    final auth = Provider.of<Auth>(context);
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: fonts.heading5("Settings", color.textColor()),
          iconTheme: IconThemeData(
            color: color.backButton(), //change your color here
          ),
          backgroundColor: color.appBarColorroute(),
        ),
        backgroundColor: color.colorofScaffoldroute(),
        body: Consumer<ColorManager>(
          builder: (context, color, _) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  auth.accesstoken.isNotEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            fonts.subTitle1("Change Your Password",
                                color.bottomnavBarInactieIcons()),
                            FormForApp(
                              email: _currpassword,
                              hideText: true,
                              placeholder: "Current Password",
                            ),
                            FormForApp(
                              email: _newpass,
                              hideText: true,
                              placeholder: "New Password",
                            ),
                            FormForApp(
                              hideText: true,
                              email: _confpass,
                              placeholder: "Confirm Password",
                            ),
                            auth.load
                                ? const CupertinoActivityIndicator()
                                : CupertinoButton(
                                    padding: const EdgeInsets.all(4),
                                    child: fonts.button(
                                        "Submit", color.textColor()),
                                    onPressed: () {
                                      if (_newpass.text == _confpass.text) {
                                        // auth.newpassword(
                                        //     _currpassword.text, _newpass.text);
                                      }
                                    },
                                  )
                          ],
                        )
                      : const SizedBox(),
                  auth.accesstoken.isNotEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        )
                      : const SizedBox(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      fonts.subTitle1(
                          "Other Settings", color.bottomnavBarInactieIcons()),
                      SizedBox(
                        height: 50,
                        child: Consumer<LocationTaker>(
                          builder: (context, toggle, _) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                fonts.body1("Notifications", color.textColor()),
                                CupertinoSwitch(
                                  value: toggle.notification,
                                  onChanged: (value) {
                                    toggle.tooglenotification();
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Consumer<LocationTaker>(
                          builder: (context, toggle, _) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                fonts.body1("Location", color.textColor()),
                                CupertinoSwitch(
                                  value: toggle.locationenable,
                                  onChanged: (value) {
                                    toggle.toggle();
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            fonts.body1("Light/Dark mode", color.textColor()),
                            CupertinoSwitch(
                              value: color.darkmode,
                              onChanged: (value) {
                                color.applyMode();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
