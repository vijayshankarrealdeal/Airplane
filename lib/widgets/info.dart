import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/model/info_model.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Info extends StatelessWidget {
  final InfoModel data;
  const Info({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    return Theme(
      data: ThemeData(
          brightness: color.darkmode ? Brightness.dark : Brightness.light),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionTileCard(
            duration: const Duration(milliseconds: 200),
            elevationCurve: Curves.decelerate,
            turnsCurve: Curves.decelerate,
            title: fonts.heading5(
              data.nya,
              color.textColor(),
            ),
            children: data.page
                .map(
                  (e) => ChangeNotifierProvider<SuList>.value(
                    value: e,
                    child: Consumer<SuList>(
                      builder: (ctx, d, _) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            tileColor: color.appBarColorroute(),
                            title: fonts.body1(e.nya, color.textColor()),
                          ),
                        );
                      },
                    ),
                  ),
                )
                .toList()),
      ),
    );
  }
}
