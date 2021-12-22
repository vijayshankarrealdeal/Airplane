import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/model/checklist_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Check extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    return Consumer<CheckModel>(builder: (context,data,_){
      return Column(
        children: [
          fonts.heading4(data.nya, color.textColor()),
          Container(

            child: Column(
              children: data.page.map((e) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  fonts.body1(e, color.textColor()),
                  IconButton(
                      onPressed: () {
                        data.isselect();
                      },
                      icon: Icon(data.select
                          ? Icons.check_box
                          : Icons.check_box_outline_blank))
                ],
              ),).toList()
            ),
          ),
        ],
      );});
  }
}
