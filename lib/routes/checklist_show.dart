import 'package:airplane/controllers/checklist_controller.dart';
import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/widgets/check.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckList extends StatelessWidget {
  const CheckList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final font = Provider.of<TypoGraphyOfApp>(context);

    return Scaffold(
        backgroundColor: color.colorofScaffoldroute(),
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: color.backButton(), //change your color here
          ),
          centerTitle: true,
          title: font.heading5("Travel CheckList", color.textColor()),
          backgroundColor: color.appBarColorroute(),
        ),
        body: ChangeNotifierProvider(
          create: (context) => CheckController(),
          child: Consumer<CheckController>(builder: (context, datacontrol, _) {
            return ListView(
              children: datacontrol.docs.map((e) => Check(data: e)).toList(),
            );
          }),
        ));
  }
}
