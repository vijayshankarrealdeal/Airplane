import 'package:airplane/controllers/account_controller.dart';
import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/widgets/loading_spinner.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HotelShow extends StatelessWidget {
  const HotelShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    return Scaffold(
      backgroundColor: color.colorofScaffoldroute(),
      body: Consumer<AccountControllers>(
        builder: (context, data, _) {
          print(data.hoteldetails.length.toString() + "sddsads");
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                iconTheme: IconThemeData(
                  color: color.backButton(), //change your color here
                ),
                backgroundColor: color.appBarColorroute(),
                actions: [
                  CupertinoButton(
                    child: Icon(CupertinoIcons.arrow_up_arrow_down),
                    onPressed: () {},
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CupertinoButton(
                            child: Icon(CupertinoIcons.macwindow),
                            onPressed: () {},
                          ),
                          fonts.body1("Check In Date", color.textColor())
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CupertinoButton(
                            child: Icon(CupertinoIcons.calendar_badge_plus),
                            onPressed: () {},
                          ),
                          fonts.body1("Check Out Date", color.textColor())
                        ],
                      ),
                      data.load
                          ? CupertinoButton(
                              child: fonts.button("Search", color.textColor()),
                              onPressed: () =>
                                  data.hotelcall(15, 22, 12, 12, 2021, 2021),
                            )
                          : const LoadingSpinner(addText: false),
                    ],
                  ),
                ]),
              ),
              data.hoteldetails.isNotEmpty
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          var _hotels = data.hoteldetails[index];
                          return Card(
                            color: color.colorofCardShowing(),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: CachedNetworkImage(
                                          imageUrl: _hotels.mediaImg)),
                                  Column(
                                    children: _hotels.hotelName
                                        .split(',')
                                        .toList()
                                        .map(
                                          (e) => fonts.caption(
                                              e, color.textColor()),
                                        )
                                        .toList(),
                                  ),
                                  Column(
                                    children: [
                                      fonts.body1(
                                          _hotels.money, color.textColor())
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: data.hoteldetails.length,
                      ),
                    )
                  : SliverFillRemaining(
                      child: Center(
                        child: fonts.heading3(
                          data.load
                              ? "Search For Hotel"
                              : "Looking For Best Fit",
                          color.textColor(),
                        ),
                      ),
                    )
            ],
          );
        },
      ),
    );
  }
}
