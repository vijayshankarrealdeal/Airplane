import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Parking extends StatelessWidget {
  const Parking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    return Scaffold(
      backgroundColor: color.colorofScaffoldroute(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: fonts.heading4("Parking", color.textColor()),
            elevation: 0,
            iconTheme: IconThemeData(
              color: color.backButton(), //change your color here
            ),
            backgroundColor: color.appBarColorroute(),
          ),
          SliverList(delegate: SliverChildListDelegate([
            fonts.body1("""\n   This is a regular car park for cars. \n""", color.textColor())
          ])),
          SliverList(delegate: SliverChildListDelegate([
            fonts.heading4("  Charges", color.textColor())
          ])),
          SliverList(delegate: SliverChildListDelegate([
            fonts.body1("""    - 0 to 2 hours: Rs 100
    - Every additional 2 hours: Rs 50
    - One day: Rs 500
    - Every additional day: Rs 300
    - Lost ticket: Rs 500 plus parking charges.""", color.textColor())
          ]))
        ],
      ),
    );
  }
}
