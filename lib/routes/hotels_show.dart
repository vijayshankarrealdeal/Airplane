import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HotelShow extends StatelessWidget {
  const HotelShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    return Scaffold(
      backgroundColor: color.colorofScaffoldroute(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: IconThemeData(
              color: color.backButton(), //change your color here
            ),
            backgroundColor: color.appBarColorroute(),
            actions: [
              CupertinoButton(
                child: Icon(CupertinoIcons.arrow_up_arrow_down),
                onPressed: () {},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CupertinoButton(
                        child: Icon(CupertinoIcons.macwindow),
                        onPressed: () {},
                      ),
                      fonts.body1("Check In Date", color.textColor())
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CupertinoButton(
                        child: Icon(CupertinoIcons.calendar_badge_plus),
                        onPressed: () {},
                      ),
                      fonts.body1("Check Out Date", color.textColor())
                    ],
                  ),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
