import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/movie_controllers.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/model/shop_model.dart';
import 'package:airplane/widgets/loading_spinner.dart';
import 'package:airplane/widgets/show_items_tab.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          elevation: 0,
          iconTheme: IconThemeData(
            color: color.backButton(), //change your color here
          ),
          backgroundColor: color.appBarColorroute(),
          bottom: TabBar(
            tabs: [
              fonts.body1("Pre", color.textColor()),
              fonts.body1("Post", color.textColor()),
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
