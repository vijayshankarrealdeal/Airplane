import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/movie_controllers.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/widgets/loading_spinner.dart';
import 'package:airplane/widgets/show_items_tab.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodPrePost extends StatelessWidget {
  const FoodPrePost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: color.colorofScaffoldroute(),
        appBar: AppBar(
          title: fonts.heading5("Restaurants", color.textColor()),
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(
            color: color.backButton(), //change your color here
          ),
          backgroundColor: color.appBarColorroute(),
          bottom: TabBar(
            tabs: [
              fonts.heading6("Pre-Security", color.textColor()),
              fonts.heading6("Post-Security", color.textColor()),
            ],
          ),
        ),
        body: Consumer<MovieController>(
          builder: (context, data, _) {
            return TabBarView(
              children: [
                ListView.builder(
                  itemCount: data.resultfood.length,
                  itemBuilder: (context, index) {
                    var national = data.resultfood;
                    return ShowItemInTheTab(
                        color: color,
                        international: national[index],
                        fonts: fonts);
                  },
                ),
                data.resultpost.isNotEmpty
                    ? ListView.builder(
                        itemCount: data.resultpost.length,
                        itemBuilder: (context, index) {
                          var international = data.resultpost;
                          return ShowItemInTheTab(
                              color: color,
                              international: international[index],
                              fonts: fonts);
                        },
                      )
                    : const LoadingSpinner(),
              ],
            );
          },
        ),
      ),
    );
  }
}
