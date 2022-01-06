import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/tikect_controller.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/model/mytrips_tickets.dart';
import 'package:airplane/routes/checklist_show.dart';
import 'package:airplane/routes/fake_ut.dart';
import 'package:airplane/routes/hotels_show.dart';
import 'package:airplane/routes/serach_for_airplances.dart';
import 'package:airplane/services/auth.dart';
import 'package:airplane/widgets/loading_spinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YourTrips extends StatelessWidget {
  const YourTrips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    final auth = Provider.of<Auth>(context);

    return Scaffold(
      backgroundColor: color.colorofScaffoldroute(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: fonts.heading5("Your Trips", color.textColor()),
        iconTheme: IconThemeData(
          color: color.backButton(), //change your color here
        ),
        backgroundColor: color.appBarColorroute(),
      ),
      body: auth.accesstoken.isEmpty
          ? Center(
              child: fonts.heading6(
                "You are not sign in",
                color.textColor(),
              ),
            )
          : ChangeNotifierProvider<TicketsAndMore>(
              create: (context) => TicketsAndMore(context),
              child: Consumer<TicketsAndMore>(
                builder: (context, controller, _) {
                  return controller.load
                      ? controller.data.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  fonts.heading6(
                                      "No Bookings", color.textColor()),
                                  const SizedBox(height: 20),
                                  CupertinoButton(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 13, horizontal: 28),
                                      color: color.buttonoutside(),
                                      child: fonts.button(
                                          "Book Flight", color.textColor()),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SearchForAirplanes(),
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            )
                          : ListView.builder(
                              itemCount: controller.data.length,
                              itemBuilder: (context, index) {
                                var e = controller.data[index];
                                return Card(
                                  color: color.planeCardColorHome(),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  elevation: 6,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 65,
                                                  width: 65,
                                                  child: Image.network(
                                                    e.flightImage,
                                                    scale: 1,
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                ),
                                                fonts.heading6(e.fightName,
                                                    color.textColor()),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                fonts.heading3(
                                                    '\u{20B9} ' +
                                                        e.price.split(' ')[1],
                                                    color.textColor()),
                                                fonts.body1(e.refund,
                                                    color.textColor()),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                fonts.body1(e.originPlace,
                                                    color.textColor()),
                                                fonts.body1(e.originTime,
                                                    color.textColor()),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                fonts.subTitle1(e.durationStop,
                                                    color.iconColor()),
                                                Container(
                                                  height: 2.0,
                                                  width: 50,
                                                  color: Colors.grey,
                                                ),
                                                fonts.body1(e.noStops,
                                                    color.textColor())
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                fonts.body1(e.destinationPlace,
                                                    color.textColor()),
                                                fonts.body1(e.destinationTime,
                                                    color.textColor()),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            e.cancel
                                                ? const SizedBox()
                                                : CupertinoButton(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 13,
                                                        horizontal: 28),
                                                    color: color.interestTab(),
                                                    child: fonts.button(
                                                        "Create/View Checklist",
                                                        color.textColor()),
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              CheckList(
                                                                  pk: e.id
                                                                      .toString()),
                                                        ),
                                                      );
                                                    }),
                                            e.cancel
                                                ? const SizedBox()
                                                : CupertinoButton(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 13,
                                                        horizontal: 28),
                                                    color: color.interestTab(),
                                                    child: fonts.button(
                                                        "Book Hotels",
                                                        color.textColor()),
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const HotelShow(),
                                                        ),
                                                      );
                                                    }),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: CupertinoButton(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 13, horizontal: 28),
                                            color: color.warning(),
                                            child: fonts.button(
                                                e.cancel
                                                    ? "Ticket Canceled"
                                                    : "Cancel Flight",
                                                color.textColor()),
                                            onPressed: e.cancel == true
                                                ? null
                                                : () => _showDialog(context,
                                                    controller, auth, e),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        e.cancel
                                            ? SizedBox(
                                                width: double.infinity,
                                                child: CupertinoButton(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 13,
                                                      horizontal: 28),
                                                  color: color.warning(),
                                                  child: fonts.button(
                                                      "Remove From Here",
                                                      color.textColor()),
                                                  onPressed: () => controller
                                                      .removeitem(e, auth),
                                                ),
                                              )
                                            : const SizedBox(),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                      : const LoadingSpinner();
                },
              ),
            ),
    );
  }

  void _showDialog(BuildContext context, TicketsAndMore functin, Auth auth,
      FlightDataT e) async {
    await showCupertinoDialog(
        context: context,
        builder: (context) {
          final fonts = Provider.of<TypoGraphyOfApp>(context);
          final colors = Provider.of<ColorManager>(context);

          return Theme(
            data: ThemeData(
                brightness:
                    colors.darkmode ? Brightness.dark : Brightness.light),
            child: CupertinoAlertDialog(
              title: fonts.body1(
                  "Do you want to cancel ticket", colors.textColor()),
              content: fonts.body1(
                  "Cancel once cannot be revert", colors.textColor()),
              actions: [
                CupertinoButton(
                    child: fonts.button("Agree", colors.warning()),
                    onPressed: () {
                      functin.cancelTicket(auth, e.id, functin.data.indexOf(e));
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FakeUI(),
                        ),
                      );
                    }),
                CupertinoButton(
                    child: fonts.button("Cancel", colors.warning()),
                    onPressed: () => Navigator.pop(context)),
              ],
            ),
          );
        });
  }
}
