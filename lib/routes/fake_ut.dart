import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FakeUI extends StatelessWidget {
  const FakeUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    return Scaffold(
      backgroundColor: color.colorofScaffoldroute(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: fonts.heading5("Status", color.textColor()),
        iconTheme: IconThemeData(
          color: color.backButton(), //change your color here
        ),
        backgroundColor: color.appBarColorroute(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.check_mark_circled,
              color: color.nowarning(),
              size: 90,
            ),
            fonts.body1("Ticket Cancelled", color.textColor())
          ],
        ),
      ),
    );
  }
}
