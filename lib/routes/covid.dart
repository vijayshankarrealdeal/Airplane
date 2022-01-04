import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Covid extends StatelessWidget {
  const Covid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    return Scaffold(
      backgroundColor: color.colorofScaffoldroute(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: fonts.heading4("Covid 19", color.textColor()),
            elevation: 0,
            iconTheme: IconThemeData(
              color: color.backButton(), //change your color here
            ),
            backgroundColor: color.appBarColorroute(),
          ),
          SliverList(delegate: SliverChildListDelegate([
            fonts.body1(""" COVID-19 Test Lab: Auriga Research Private Limited
Link to pre-book: https://bit.ly/3HmBd2h 
Cost for test:
   - Abbott ID Express RT-PCR test: Rs 3,000. Waiting time: Upto 60 minutes
   - TataMD - Rapid-PCR test: Rs. 1,200. Waiting time: Upto 2 hours 30 minutes 
   - Standard RT-PCR test: Rs 500. Waiting time: 4-6 hours
These rates are fixed by the Government of Karnataka 
Process to claim refund
   - Send an email to accounts@aurigaresearch.com or call them on +91 9535478675
   - The email must have the below information to issue the refund:
   - Full Name
   - Registered Phone number
   - Registered Email ID
   - Payment Transaction proof
   - Registration details
   - Reason for Refund""", color.textColor())
          ],)),
          SliverList(delegate: SliverChildListDelegate([
            fonts.heading5("\nGuidelines\n", color.textColor())
          ])),
          SliverList(delegate: SliverChildListDelegate([
            fonts.body1("""PRE-BOARDING
   - Passengers must submit self-declaration form on the Air Suvidha portal (www.newdelhiairport.in) before scheduled travel, including last 14 days travel details
   - Upload a negative COVID-19 RT-PCR report; test must be conducted within 72 hrs prior to the journey. A declaration with respect to authenticity of the test report is mandatory.
   - Upload the vaccination certificate and mention the date of final dose of vaccination.
   - Only asymptomatic travellers will be allowed to board after thermal screening
   - Passengers must download Aarogya Setu app on their mobile phones
   - Passengers must give an undertaking on the portal or otherwise to the MoCA (GoI) through the Airline that they would abide by the decisions of the appropriate Govt authorities to undergo home/institutional quarantine/self-health monitoring, as warranted.
   - Passengers originating or transiting from at risk-countries shall be informed by the airlines that they will undergo post arrival testing, quarantine if tested negative, stringent isolation protocols if tested positive
   - As per GoI circular dated Dec 14, 2021, international passengers arriving from or having visited 'Countries at Risk' must pre-book their RT-PCR test. This will come into effect on Dec 20, 2021. The Air Suvidha portal will be modified to allow passengers to pre-book the test. The concerned link will be displayed to passengers while filling up the online self-declaration form. Airlines will verify the pre-booking of test prior to boarding. Passengers facing any difficulty in pre-booking will be accompanied by airline staff to the registration counter at the Airport for testing.
\nARRIVAL AT BLR AIRPORT
   - Passengers have to undergo Thermal screening (if found symptomatic, will be isolated as per protocol)
   - The online self-declaration form shall be shown to the Airport Health Officials
   - Passengers coming from Countries at risk viz Countries in Europe including UK, South Africa, Brazil, Botswana, China, Ghana, Mauritius, New Zealand, Zimbabwe, Tanzania, Hong Kong and Israel :
   - Submission of swab sample for post arrival COVID-19 test at the point of arrival (self-paid). Wait for results at the airport.
   - If tested negative, follow home quarantine for 7 days. Retest on 8th day of arrival. If negative, self-monitor health for the next 7 days
   - If tested positive, samples will be sent for genomic testing; sent to a separate isolation facility for treatment as per standard protocol
   - Passengers coming from Countries (of origin of flight) other than the countries at risk, listed above, will be allowed to leave the airport and shall self-monitor their health for 14 days post arrival. 2% of the passengers shall undergo random testing at airport on arrival. Such travellers shall be escorted by the concerned airlines/MoCA to testing area on arrival. The cost of testing of such travellers will be borne by BIAL. If tested positive, standard protocol will be followed
Note: Children under the age of 5 years are exempted from pre and post arrival testing. However, if found symptomatic for COVID-19 on arrival, or during home quarantine period, they shall undergo testing and will be treated as per State protocol.
For updated information on countries at risk, as specified by Govt. of India, visit www.mohfw.gov.in""", color.textColor())
          ])),
        ],
      ),
    );
  }
}
