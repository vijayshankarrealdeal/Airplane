import 'dart:math';
import 'dart:ui';

import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/model/plane.dart';
import 'package:airplane/routes/bookticket.dart';
import 'package:airplane/routes/login.dart';
import 'package:airplane/services/auth.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class ShowPlaneDetails extends StatelessWidget {
  final FlightData data;

  const ShowPlaneDetails({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    final auth = Provider.of<Auth>(context);
    return Scaffold(
      backgroundColor: color.colorofScaffoldroute(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              elevation: 0,
              iconTheme: IconThemeData(
                color: color.backButton(), //change your color here
              ),
              backgroundColor: color.appBarColorroute()),
          SliverPersistentHeader(
            pinned: false,
            delegate: PlaneHeaderDelgate(
              height: MediaQuery.of(context).size.height * 0.4,
              fonts: fonts,
              color: color,
              userd: data,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                fonts.heading2(
                  data.fightName,
                  color.textColor(),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    fonts.heading4(
                      data.originPlace,
                      color.textColor(),
                    ),
                    fonts.heading4(
                      data.destinationPlace,
                      color.textColor(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    fonts.heading6(
                      data.originTime,
                      color.textColor(),
                    ),
                    fonts.heading6(
                      data.originTime,
                      color.textColor(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    fonts.heading6(
                      data.originTime,
                      color.textColor(),
                    ),
                    fonts.heading6(
                      data.destinationTime,
                      color.textColor(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        fonts.heading4(
                          data.originPlace,
                          color.textColor(),
                        ),
                        fonts.heading4(
                          data.destinationPlace,
                          color.textColor(),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        fonts.heading2(
                          '\u{20B9} ' + data.price.toString(),
                          color.textColor(),
                        ),
                        fonts.body1(
                          data.refund,
                          color.warning(),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                fonts.heading6(
                  "Services",
                  color.textColor(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ServicesIconPlane(
                      color: color,
                      fonts: fonts,
                      servieType: "Wifi",
                      icon: CupertinoIcons.wifi,
                    ),
                    ServicesIconPlane(
                      color: color,
                      fonts: fonts,
                      servieType: "Food",
                      icon: CupertinoIcons.wand_rays,
                    ),
                    ServicesIconPlane(
                        color: color,
                        fonts: fonts,
                        servieType: "Entertainment",
                        icon: CupertinoIcons.video_camera),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: SizedBox(
        width: double.infinity,
        child: CupertinoButton(
          borderRadius: BorderRadius.zero,
          color: color.interestTab(),
          child: fonts.button("Book", color.buttonInside()),
          onPressed: () {
            if (auth.accesstoken.isEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignIn(),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookTicket(
                    data: data,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class ServicesIconPlane extends StatelessWidget {
  const ServicesIconPlane({
    Key? key,
    required this.color,
    required this.fonts,
    required this.icon,
    required this.servieType,
  }) : super(key: key);

  final ColorManager color;
  final TypoGraphyOfApp fonts;
  final String servieType;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: color.iconColor(), size: 45),
        fonts.body1(
          servieType,
          color.textColor(),
        ),
      ],
    );
  }
}

class PlaneHeaderDelgate extends SliverPersistentHeaderDelegate {
  final double height;
  final TypoGraphyOfApp fonts;
  final ColorManager color;
  final FlightData userd;

  PlaneHeaderDelgate(
      {required this.height,
      required this.fonts,
      required this.color,
      required this.userd});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(userd.flightImage),
            ),
            gradient: const LinearGradient(
              colors: [Colors.transparent, Colors.black54],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
          // child: BackdropFilter(
          //   filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: color.colorofScaffold().withOpacity(
          //             0.35,
          //           ),
          //     ),
          //   ),
          // ),
        ),
        Positioned(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [],
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  double titleOpactiy(double shrinkOffset) {
    return 1.0 - max(0.0, shrinkOffset) / maxExtent;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
