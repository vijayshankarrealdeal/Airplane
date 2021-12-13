import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingSpinner extends StatelessWidget {
  final bool addText;
  const LoadingSpinner({Key? key, this.addText = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<TypoGraphyOfApp, ColorManager>(
      builder: (conetxt, font, color, _) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Theme(
                data: ThemeData(
                    brightness:
                        color.darkmode ? Brightness.dark : Brightness.light),
                child: const CupertinoActivityIndicator(),
              ),
              font.heading6("Loading", color.textColor())
            ],
          ),
        );
      },
    );
  }
}
