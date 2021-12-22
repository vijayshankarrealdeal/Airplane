import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/navbar/change.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MaterialBottomNavigationBar extends StatelessWidget {
  const MaterialBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<ChangeofPage>(context);
    return Consumer<ColorManager>(
      builder: (contxt, color, _) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.065,
          decoration: BoxDecoration(
            color: color.bottomnavBar(),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(
                      CupertinoIcons.app,
                      size: nav.size,
                      color: nav.acti[0]!
                          ? color.bottomnavBaractieIcons()
                          : color.bottomnavBarInactieIcons(),
                    ),
                    onPressed: () {
                      nav.kCallback(0);
                    }),
                // IconButton(
                //     icon: Icon(
                //       CupertinoIcons.add_circled,
                //       size: nav.size,
                //       color: nav.acti[1]!
                //           ? color.bottomnavBaractieIcons()
                //           : color.bottomnavBarInactieIcons(),
                //     ),
                //     onPressed: () {
                //       nav.kCallback(1);
                //     }),
                Transform.rotate(
                  angle: 0.5,
                  child: IconButton(
                      icon: Icon(
                        CupertinoIcons.bell,
                        size: nav.size,
                        color: nav.acti[2]!
                            ? color.bottomnavBaractieIcons()
                            : color.bottomnavBarInactieIcons(),
                      ),
                      onPressed: () {
                        nav.kCallback(2);
                      }),
                ),
                // IconButton(
                //     icon: Icon(
                //       CupertinoIcons.circle,
                //       size: nav.size,
                //       color: nav.acti[3]! ? nav.active : Colors.grey,
                //     ),
                //     onPressed: () {
                //       nav.kCallback(3);
                //     }),
              ],
            ),
          ),
        );
      },
    );
  }
}
