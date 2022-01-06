import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/widgets/bullet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Medical extends StatelessWidget {
  const Medical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);

    List<String> _data = [
      "h@ Airport Medical Services",
      "b@ Aster Medical Centre adjacent to the Terminal building east side",
      "b@ Aster Medical Clinic 1st floor next to Forex counter",
      "b@ Duty Medical officer (Medical Centre) 97397 33335",
      "b@ Duty Medical officer (Aster PTB clinic) - 91487 90154",
      "h@ Auriga Research Private Limited",
      "b@ Locations departures (west side of the terminal building) & common arrival hall near gate # 11",
      "b@ Contact - 9591378675 / 9591478675 / 9591678675",
      "h@ TATA MD Aster Lab",
      "b@ Location Kerbside - lane 1",
      "b@ Conttact  - 080-4555 3333 "
    ];
    return Scaffold(
      backgroundColor: color.colorofScaffoldroute(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title:
                fonts.heading5("Airport Medical Services", color.textColor()),
            elevation: 0,
            iconTheme: IconThemeData(
              color: color.backButton(), //change your color here
            ),
            backgroundColor: color.appBarColorroute(),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
                delegate: SliverChildListDelegate(_data.map((e) {
              if (e.contains('h@')) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: fonts.heading6(e.substring(3), color.textColor()),
                );
              } else if (e.contains('b@')) {
                return bulletPoint(e.substring(3), color);
              } else {
                return fonts.body1(e, color.textColor());
              }
            }).toList())),
          ),
        ],
      ),
    );
  }
}
