import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/planepage_controllers.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/widgets/show_airplane_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AirplaneWatchList extends StatelessWidget {
  const AirplaneWatchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);

    return Scaffold(
      backgroundColor: color.colorofScaffoldroute(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: fonts.heading5("Wishlist", color.textColor()),
        iconTheme: IconThemeData(
          color: color.backButton(), //change your color here
        ),
        backgroundColor: color.appBarColorroute(),
      ),
      body: Center(
        child: Consumer<PlaneControllers>(
          builder: (context, data, _) {
            return data.watchLish.isNotEmpty
                ? ListView.builder(
                    itemCount: data.watchLish.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                        value: data.watchLish[index],
                        child: const ShowAirPlaneCards(),
                      );
                    })
                : Center(
                    child: fonts.heading4(
                        "Nothing in Wishlist", color.textColor()));
          },
        ),
      ),
    );
  }
}
