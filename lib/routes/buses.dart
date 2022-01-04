import 'package:airplane/controllers/bus_controller.dart';
import 'package:airplane/widgets/bus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';

class BuList extends StatelessWidget {
  const BuList({Key? key}) : super(key: key);
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
          title: font.heading5("Buses", color.textColor()),
          backgroundColor: color.appBarColorroute(),
        ),
        body: ChangeNotifierProvider(
          create: (context) => BusController(),
          child: Consumer<BusController>(builder: (context, datacontrol, _) {
            return ListView(
              children: datacontrol.docs.map((e) => Bus(data: e)).toList(),
            );
          }),
        ));
  }
}