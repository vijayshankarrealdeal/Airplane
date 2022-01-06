import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnotherServices extends StatelessWidget {
  const AnotherServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);

    List<String> _data = [
      "BIAL (Bangalore International Airport Limited) \nKempegowda International Airport",
      "Bengaluru (BLR Airport), named after the founder of the City, Hiriya Kempegowda, has the unique distinction of being the first Greenfield Airport in India, established on a Public-Private Partnership (PPP) model.",
      "This heralded a revolution in Indian aviation, as more airports in the Country were privatised, thereafter.",
      "BLR Airport commenced operations on May 24, 2008 33 months from the start of construction. The expansion of the Terminal was completed in 2014 to cater to the steady, unprecedented growth in passenger volumes.",
      "Having served 10 million passengers in 2008, BLR Airport witnessed phenomenal growth during the subsequent years, becoming the fastest growing airport in the world in 2018. As the busiest Airport in South India and the third largest in the Country, BLR Airport welcomed 33.3 million passengers in FY 2018-19.",
      "Powered with cutting-edge technology, including Contactless Passenger Processing, Self Bag-Drops, Biometric-based self-boarding solution, BLR Airport connects Bengaluru to 61 domestic and 14 international destinations.",
    ];

    return Scaffold(
      backgroundColor: color.colorofScaffoldroute(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: fonts.heading5("About Us", color.textColor()),
            centerTitle: true,
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
                _data.map((e) {
                  if (_data.indexOf(e) == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: fonts.heading6(e, color.textColor()),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: fonts.body1(
                        e,
                        color.textColor(),
                      ),
                    );
                  }
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
