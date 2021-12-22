import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/model/checklist_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Check extends StatelessWidget {
  final CheckModel data;
  const Check({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        fonts.heading3(data.nya, color.textColor()),
        Container(
          child: Column(
              children: data.page
                  .map(
                    (e) => ChangeNotifierProvider<SubList>.value(
                      value: e,
                      child: Consumer<SubList>(
                        builder: (ctx, d, _) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              fonts.body1(e.nya, color.textColor()),
                              IconButton(
                                  onPressed: () {
                                    e.isselect();
                                  },
                                  icon: Icon(e.select
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank))
                            ],
                          );
                        },
                      ),
                    ),
                  )
                  .toList()),
        ),
      ],
    );
  }
}
