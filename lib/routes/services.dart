import 'package:airplane/controllers/service_controller.dart';
import 'package:airplane/widgets/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';

class ServiceList extends StatelessWidget {
  const ServiceList({Key? key}) : super(key: key);
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
          title: font.heading5("Services", color.textColor()),
          backgroundColor: color.appBarColorroute(),
        ),
        body: ChangeNotifierProvider(
          create: (context) => ServiceController(),
          child: Consumer<ServiceController>(builder: (context, datacontrol, _) {
            return ListView(
              children: datacontrol.docs.map((e) => Service(data: e)).toList(),
            );
          }),
        ));
  }
}