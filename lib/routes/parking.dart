import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/widgets/bullet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Parking extends StatelessWidget {
  const Parking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    List<String> _data = [
      "h@ Charges",
      "This is a regular car park for cars.",
      "b@ 0 to 2 hours: Rs 100",
      "b@ Every additional 2 hours: Rs 50",
      "b@ One day: Rs 500",
      "b@ Every additional day: Rs 300",
      "b@ Lost ticket: Rs 500 plus parking charges."
    ];
    return Scaffold(
      backgroundColor: color.colorofScaffoldroute(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: fonts.heading5("Parking", color.textColor()),
            elevation: 0,
            iconTheme: IconThemeData(
              color: color.backButton(), //change your color here
            ),
            backgroundColor: color.appBarColorroute(),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(18),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                _data.map(
                  (e) {
                    if (e.contains('h@')) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child:
                            fonts.heading5(e.substring(3), color.textColor()),
                      );
                    } else if (e.contains('b@')) {
                      return bulletPoint(e.substring(3), color);
                    } else {
                      return fonts.body1(e, color.textColor());
                    }
                  },
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
