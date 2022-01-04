import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    return Scaffold(
      backgroundColor: color.colorofScaffoldroute(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: fonts.heading4("About us", color.textColor()),
            elevation: 0,
            iconTheme: IconThemeData(
              color: color.backButton(), //change your color here
            ),
            backgroundColor: color.appBarColorroute(),
          ),
          SliverList(delegate: SliverChildListDelegate([
            fonts.body1("""f you have any queries or suggestions, or wish to tell us about your experience at Kempegowda International Airport, Bengaluru, please get in touch with us:

(WhatsApp Chat Only)

 

 

+91-8884998888
080-22012001
feedback@bialairport.com""", color.textColor())
          ]))
        ],
      ),
    );
  }
}
