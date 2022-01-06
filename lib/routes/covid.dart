import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/widgets/bullet.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Covid extends StatelessWidget {
  const Covid({Key? key}) : super(key: key);
  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    List<String> _data = [
      "h@ COVID-19 Test Lab: Auriga Research Private Limited",
      "Link to pre-book->https://bit.ly/3HmBd2h",
      "Cost for test:",
      "b@ Abbott ID Express RT-PCR test: Rs 3,000. Waiting time: Upto 60 minutes",
      "b@ TataMD - Rapid-PCR test: Rs. 1,200.Waiting time: Upto 2 hours 30 minutes ",
      "b@ Standard RT-PCR test: Rs 500. Waiting time: 4-6 hours",
      "These rates are fixed by the Government of Karnataka\nProcess to claim refund",
      "b@ Send an email to accounts@aurigaresearch.com or call them on +91 9535478675",
      "b@ The email must have the below information to issue the refund:",
      "b@ Full Name",
      "b@ Registered Phone number",
      "b@ Registered Email ID",
      "b@ Payment Transaction proof",
      "b@ Registration details",
      "b@ Reason for Refund",
      "h@ Guidelines",
      " Pre-Boarding",
      "b@ Passengers must submit self-declaration form on the Air Suvidha portal (www.newdelhiairport.in) before scheduled travel, including last 14 days travel details",
      "b@ Upload a negative COVID-19 RT-PCR report; test must be conducted within 72 hrs prior to the journey. A declaration with respect to authenticity of the test report is mandatory.",
      "b@ Upload the vaccination certificate and mention the date of final dose of vaccination.",
      "b@ Only asymptomatic travellers will be allowed to board after thermal screening",
      "b@ Passengers must download Aarogya Setu app on their mobile phones",
      "b@ Passengers must give an undertaking on the portal or otherwise to the MoCA (GoI) through the Airline that they would abide by the decisions of the appropriate Govt authorities to undergo home/institutional quarantine/self-health monitoring, as warranted.",
      "b@ Passengers originating or transiting from at risk-countries shall be informed by the airlines that they will undergo post arrival testing, quarantine if tested negative, stringent isolation protocols if tested positive",
      "b@ As per GoI circular dated Dec 14, 2021, international passengers arriving from or having visited 'Countries at Risk' must pre-book their RT-PCR test. This will come into effect on Dec 20, 2021. The Air Suvidha portal will be modified to allow passengers to pre-book the test. The concerned link will be displayed to passengers while filling up the online self-declaration form. Airlines will verify the pre-booking of test prior to boarding. Passengers facing any difficulty in pre-booking will be accompanied by airline staff to the registration counter at the Airport for testing.",
      "h@ Arrival at blr airport",
      "b@ Passengers have to undergo Thermal screening (if found symptomatic, will be isolated as per protocol",
      "b@ The online self-declaration form shall be shown to the Airport Health Officials",
      "b@ Passengers coming from Countries at risk viz Countries in Europe including UK, South Africa, Brazil, Botswana, China, Ghana, Mauritius, New Zealand, Zimbabwe, Tanzania, Hong Kong and Israel",
      "b@ Submission of swab sample for post arrival COVID-19 test at the point of arrival (self-paid). Wait for results at the airport.",
      "b@ If tested negative, follow home quarantine for 7 days. Retest on 8th day of arrival. If negative, self-monitor health for the next 7 days",
      "b@ If tested positive, samples will be sent for genomic testing; sent to a separate isolation facility for treatment as per standard protocol",
      "b@ Passengers coming from Countries (of origin of flight) other than the countries at risk, listed above, will be allowed to leave the airport and shall self-monitor their health for 14 days post arrival.\n2% of the passengers shall undergo random testing at airport on arrival.\nSuch travellers shall be escorted by the concerned airlines/MoCA to testing area on arrival.\nThe cost of testing of such travellers will be borne by BIAL.\nIf tested positive, standard protocol will be followed",
      "Note: Children under the age of 5 years are exempted from pre and post arrival testing.\nHowever, if found symptomatic for COVID-19 on arrival,\nor during home quarantine period, they shall undergo\n testing and will be treated as per State protocol.",
      "For updated information on countries at risk,\nas specified by Govt.of India",
      "visit->www.mohfw.gov.in",
    ];
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);

    return Scaffold(
      backgroundColor: color.colorofScaffoldroute(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: fonts.heading5("Covid 19", color.textColor()),
            elevation: 0,
            iconTheme: IconThemeData(
              color: color.backButton(), //change your color here
            ),
            backgroundColor: color.appBarColorroute(),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                _data.map((e) {
                  if (e.contains('h@')) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: fonts.heading6(e.substring(3), color.textColor()),
                    );
                  } else if (e.contains('->')) {
                    var _text = e.split('->');
                    return Row(
                      children: [
                        fonts.body1(_text[0], color.textColor()),
                        CupertinoButton(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            onPressed: () => _launchURL(_text[1]),
                            child: fonts.button(_text[1], color.backButton())),
                      ],
                    );
                  } else if (e.contains('b@')) {
                    return bulletPoint(e.substring(3), color);
                  } else if (e.contains('These rates are fixed')) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: fonts.subTitle1(e, color.warning()),
                    );
                  } else {
                    return fonts.body1(e, color.textColor());
                  }
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
