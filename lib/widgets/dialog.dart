import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> showAlertDialog(BuildContext context, String message) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        final fonts = Provider.of<TypoGraphyOfApp>(context);
        final colors = Provider.of<ColorManager>(context);
        return Theme(
          data: ThemeData(
              brightness: colors.darkmode ? Brightness.dark : Brightness.light),
          child: AlertDialog(
            title: fonts.body1("Alert", colors.textColor()),
            content: fonts.body1(message, colors.textColor()),
            actions: [
              CupertinoButton(
                  child: fonts.button("Cancel", colors.warning()),
                  onPressed: () => Navigator.pop(context)),
            ],
          ),
        );
      });
}
