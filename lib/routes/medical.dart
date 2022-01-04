import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Medical extends StatelessWidget {
  const Medical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    return Scaffold(
      backgroundColor: color.colorofScaffoldroute(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: fonts.heading4("Airport Medical Services", color.textColor()),
            elevation: 0,
            iconTheme: IconThemeData(
              color: color.backButton(), //change your color here
            ),
            backgroundColor: color.appBarColorroute(),
          ),
          SliverList(delegate: SliverChildListDelegate([
            fonts.heading5("""Airport Medical Services""", color.textColor())
          ])),
          SliverList(delegate: SliverChildListDelegate([
            fonts.body1("""    - Aster Medical Centre – adjacent to the Terminal building east side
    - Aster Medical Clinic – 1st floor next to Forex counter
    - Duty Medical officer (Medical Centre) – 97397 33335  
    - Duty Medical officer (Aster PTB clinic) - 91487 90154""", color.textColor())
          ])),
          SliverList(delegate: SliverChildListDelegate([
            fonts.heading5("\nCOVID-19 Testing Facilities - operational 24X7", color.textColor())
          ])),
          SliverList(delegate: SliverChildListDelegate([
            fonts.body1(""" Auriga Research Private Limited - Click here 
    - Locations – departures (west side of the terminal building) & common arrival hall near gate # 11
    - Contact - 9591378675 / 9591478675 / 9591678675
TATA MD Aster Lab - Click here 
    - Location – Kerbside - lane 1
    - Conttact  - 080-4555 3333 """, color.textColor())
          ]))
        ],
      ),
    );
  }
}
