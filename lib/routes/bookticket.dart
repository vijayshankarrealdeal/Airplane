import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/model/plane.dart';
import 'package:airplane/widgets/form.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookTicket extends StatelessWidget {
  final FlightData data;

  const BookTicket({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _name = TextEditingController();
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    return Scaffold(
      backgroundColor: color.colorofScaffoldroute(),
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: color.backButton(), //change your color here
        ),
        backgroundColor: color.appBarColorroute(),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: color.colorofScaffoldroute(),
                        child: CachedNetworkImage(
                          imageUrl: data.flightImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      fonts.heading4(
                        data.fightName,
                        color.textColor(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      fonts.heading6(
                        data.originPlace,
                        color.textColor(),
                      ),
                      fonts.heading6(
                        data.destinationPlace,
                        color.textColor(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      fonts.heading6(
                        data.originTime,
                        color.textColor(),
                      ),
                      fonts.heading6(
                        data.originTime,
                        color.textColor(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      fonts.heading6(
                        data.originTime,
                        color.textColor(),
                      ),
                      fonts.heading6(
                        data.destinationTime,
                        color.textColor(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          fonts.heading6(
                            data.originPlace,
                            color.textColor(),
                          ),
                          fonts.heading6(
                            data.destinationPlace,
                            color.textColor(),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          fonts.heading3(
                            '\u{20B9} ' + data.price.toString(),
                            color.textColor(),
                          ),
                          fonts.body1(
                            data.refund,
                            color.warning(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: FormForApp(
              change: (s) {},
              addWordCount: false,
              email: _name,
              placeholder: 'Name',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: FormForApp(
              change: (s) {},
              addWordCount: false,
              email: _name,
              placeholder: 'Card Number',
            ),
          ),
          const SizedBox(height: 20),
          CupertinoButton(
            color: color.buttonOutside(),
            child: fonts.button("Confirm", color.buttonInside()),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
