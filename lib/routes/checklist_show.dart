import 'package:airplane/controllers/checklist_controller.dart';
import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/model/checklist_model.dart';
import 'package:airplane/widgets/check.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckList extends StatelessWidget {
  const CheckList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: color.backButton(), //change your color here
          ),
          backgroundColor: color.appBarColorroute(),
        ),
        body: ChangeNotifierProvider(
      create: (context) => CheckController(),
      child: Consumer<CheckController>(builder: (context, datacontrol, _) {
        return ListView(
            children: datacontrol.docs
                .map(
                  (e) => ChangeNotifierProvider<CheckModel>.value(
                    value: e,
                    child: Check()
                  ),
                )
                .toList());
      }),
    ));
  }
}


