import 'package:airplane/controllers/planepage_controllers.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/model/plane.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowAirPlaneCards extends StatelessWidget {
  const ShowAirPlaneCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer3<PlaneControllers, Data, TypoGraphyOfApp>(
      builder: (context, logicBoard, e, fonts, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: GestureDetector(
          onTap: () {
            if(e.selected)
            {
            logicBoard.removeWatchList(e);

            }else{
            logicBoard.addToWatchList(e);

            }
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 0.8,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  e.selected
                      ? const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(CupertinoIcons.checkmark_circle,color:Colors.green,))
                      : const SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 65,
                            width: 65,
                            child: Image.network(
                              e.fightImg,
                              scale: 1,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          fonts.heading6(e.fightName, Colors.black)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          fonts.body2(e.orginCode, Colors.black),
                          fonts.body2(e.orginTime, Colors.black),
                          fonts.body2(e.orginDate, Colors.black),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          fonts.subTitle1(e.durationOfFlight, Colors.grey),
                          Container(
                            height: 2.0,
                            width: 50,
                            color: Colors.grey,
                          ),
                          fonts.body1(e.durationStops, Colors.black)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          fonts.body2(e.destCode, Colors.black),
                          fonts.body2(e.destTime, Colors.black),
                          fonts.body2(e.destDate, Colors.black),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          fonts.heading5(
                              e.orginCity.toString() + ' - ', Colors.black),
                          fonts.heading5(e.destCity.toString(), Colors.black),
                        ],
                      ),
                      Column(
                        children: [
                          fonts.heading3('\u{20B9}' + e.flightPrice.toString(),
                              Colors.black),
                          fonts.body1(
                              e.discountCredit.substring(0, 4) + ' App credit.',
                              Colors.red),
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
