import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: color.backButton(), //change your color here
          ),
          backgroundColor: color.appBarColor(),
        ),
        backgroundColor: color.colorofScaffold(),
        body: Consumer<ColorManager>(
          builder: (context, color, _) {
            return SizedBox(
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
            );
          },
        ),
      ),
    );
  }
}
