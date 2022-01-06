import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _data = [
      "If you have any queries or suggestions",
      "or wish to tell us about your experience at Kempegowda International Airport, Bengaluru,\nplease get in touch with us:",
      "WhatsApp Chat Only",
      "+91-8884998888",
      "080-22012001",
      "feedback@bialairport.com"
    ];

    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    return Scaffold(
      backgroundColor: color.colorofScaffoldroute(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: fonts.heading5("Contact Us", color.textColor()),
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
                [
                  fonts.heading6(_data[0], color.textColor()),
                  const SizedBox(height: 10),
                  fonts.subTitle1(_data[1], color.textColor()),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  fonts.body1(_data[2], color.textColor()),
                  const SizedBox(height: 10),
                  fonts.body1(_data[3], color.textColor()),
                  const SizedBox(height: 10),
                  fonts.body1(_data[4], color.textColor()),
                  const SizedBox(height: 10),
                  fonts.body1(_data[5], color.textColor()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
