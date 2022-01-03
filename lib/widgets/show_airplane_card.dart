import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/planepage_controllers.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/model/plane.dart';
import 'package:airplane/routes/show_plane_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowAirPlaneCards extends StatelessWidget {
  const ShowAirPlaneCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer4<PlaneControllers, FlightData, TypoGraphyOfApp,
        ColorManager>(
      builder: (context, logicBoard, e, fonts, color, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowPlaneDetails(data: e),
            ),
          ),
          child: Card(
            color: color.planeCardColorHome(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (e.isselected) {
                          logicBoard.removeWatchList(e);
                        } else {
                          logicBoard.addToWatchList(e);
                        }
                      },
                      child: Icon(
                        e.isselected
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        color: e.isselected ? color.warning() : Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
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
                          fonts.heading6(e.fightName, color.textColor()),
                        ],
                      ),
                      Column(
                        children: [
                          fonts.heading3(e.price.toString(), color.textColor()),
                          fonts.body1(e.refund, color.textColor()),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          fonts.body1(e.originPlace, color.textColor()),
                          fonts.body1(e.originTime, color.textColor()),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          fonts.subTitle1(e.durationStop, color.iconColor()),
                          Container(
                            height: 2.0,
                            width: 50,
                            color: Colors.grey,
                          ),
                          fonts.body1(e.noStops, color.textColor())
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          fonts.body1(e.destinationPlace, color.textColor()),
                          fonts.body1(e.destinationTime, color.textColor()),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
