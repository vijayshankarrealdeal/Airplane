import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/movie_controllers.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/widgets/loading_spinner.dart';
import 'package:airplane/widgets/show_items_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingShowAll extends StatelessWidget {
  const ShoppingShowAll({
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
          title: fonts.heading5("Shopping", color.textColor()),
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(
            color: color.backButton(), //change your color here
          ),
          backgroundColor: color.appBarColorroute(),
          bottom: TabBar(
            tabs: [
              fonts.body1("National", color.textColor()),
              fonts.body1("International", color.textColor()),
            ],
          ),
        ),
        body: Consumer<MovieController>(
          builder: (context, data, _) {
            return TabBarView(
              children: [
                ListView.builder(
                  itemCount: data.resultshop.length,
                  itemBuilder: (context, index) {
                    var national = data.resultshop;
                    return ShowItemInTheTab(
                        color: color,
                        international: national[index],
                        fonts: fonts);
                  },
                ),
                data.resultshopInter.isNotEmpty
                    ? ListView.builder(
                        itemCount: data.resultshopInter.length,
                        itemBuilder: (context, index) {
                          var international = data.resultshopInter;
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
