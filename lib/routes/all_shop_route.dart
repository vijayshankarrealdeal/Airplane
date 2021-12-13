import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/movie_controllers.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/widgets/loading_spinner.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        backgroundColor: color.colorofScaffold(),
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: color.backButton(), //change your color here
          ),
          backgroundColor: color.appBarColor(),
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
                    return Container(
                      color: color.appBarColor(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.35,
                            width: double.infinity,
                            child: Image.network(
                              national[index].img,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                fonts.heading4(
                                    national[index].title, color.textColor()),
                                const SizedBox(height: 10),
                                AutoSizeText(
                                  national[index].content,
                                  style: GoogleFonts.sourceSansPro(
                                      color: color.textColor(),
                                      fontSize: 15,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.5),
                                ),
                                fonts.button(
                                    national[index].opening, color.textColor()),
                                fonts.caption(national[index].contanctDetails,
                                    color.textColor()),
                                fonts.caption(national[index].location,
                                    color.textColor()),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    );
                  },
                ),
                data.resultshopInter.isNotEmpty
                    ? ListView.builder(
                        itemCount: data.resultshopInter.length,
                        itemBuilder: (context, index) {
                          var international = data.resultshopInter;
                          return Container(
                            color: color.appBarColor(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                  width: double.infinity,
                                  child: Image.network(
                                    international[index].img,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      fonts.heading4(international[index].title,
                                          color.textColor()),
                                      const SizedBox(height: 10),
                                      AutoSizeText(
                                        international[index].content,
                                        style: GoogleFonts.sourceSansPro(
                                            color: color.textColor(),
                                            fontSize: 15,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.5),
                                      ),
                                      fonts.button(international[index].opening,
                                          color.textColor()),
                                      fonts.caption(
                                          international[index].contanctDetails,
                                          color.textColor()),
                                      fonts.caption(
                                          international[index].location,
                                          color.textColor()),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          );
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
