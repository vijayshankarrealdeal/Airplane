import 'package:airplane/controllers/colormager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OffersDeals extends StatelessWidget {
  const OffersDeals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          color: color.planeCardColorHome(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Icon(
                      CupertinoIcons.check_mark_circled_solid,
                      color: color.nowarning(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
