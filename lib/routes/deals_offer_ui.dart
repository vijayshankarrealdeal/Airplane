import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/movie_controllers.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/widgets/loading_spinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OffersDeals extends StatelessWidget {
  const OffersDeals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);

    return Scaffold(
      backgroundColor: color.colorofScaffoldroute(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: fonts.heading5("Deals Offers", color.textColor()),
        iconTheme: IconThemeData(
          color: color.backButton(), //change your color here
        ),
        backgroundColor: color.appBarColorroute(),
      ),
      body: Consumer<MovieController>(builder: (context, data, _) {
        return data.resultdeals.isEmpty
            ? const LoadingSpinner()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: data.resultdeals.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: color.planeCardColorHome(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                fonts.heading5(data.resultdeals[index].title,
                                    color.textColor()),
                                fonts.body1(data.resultdeals[index].content,
                                    color.textColor()),
                                fonts.heading4(data.resultdeals[index].discount,
                                    color.textColor())
                              ],
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                CupertinoIcons.checkmark_seal,
                                color: color.backButton(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
      }),
    );
  }
}
