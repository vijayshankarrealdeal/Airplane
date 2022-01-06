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
import 'package:line_icons/line_icons.dart';
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
              title: fonts.heading5("Flight Details", color.textColor()),
              centerTitle: true,
              elevation: 0,
              iconTheme: IconThemeData(
                color: color.backButton(), //change your color here
              ),
              backgroundColor: color.appBarColorroute()),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            CachedNetworkImageProvider(data.flightImage),
                      ),
                      fonts.heading4(
                        data.fightName,
                        color.textColor(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      fonts.heading6(
                        data.originPlace,
                        color.textColor(),
                      ),
                      fonts.heading6(
                        data.destinationPlace,
                        color.textColor(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 50),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      fonts.heading3(
                        data.price.toString(),
                        color.textColor(),
                      ),
                      fonts.body1(
                        data.refund,
                        color.warning(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: fonts.heading6(
                          "Services",
                          color.textColor(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            icon: LineIcons.utensils,
                          ),
                          ServicesIconPlane(
                              color: color,
                              fonts: fonts,
                              servieType: "Leisure",
                              icon: CupertinoIcons.video_camera),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                ],
              ),
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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: color.iconColor(), size: 45),
        fonts.body2(
          servieType,
          color.textColor(),
        ),
      ],
    );
  }
}

// class PlaneHeaderDelgate extends SliverPersistentHeaderDelegate {
//   final double height;
//   final TypoGraphyOfApp fonts;
//   final ColorManager color;
//   final FlightData userd;

//   PlaneHeaderDelgate(
//       {required this.height,
//       required this.fonts,
//       required this.color,
//       required this.userd});

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               fit: BoxFit.cover,
//               image: CachedNetworkImageProvider(userd.flightImage),
//             ),
//             gradient: const LinearGradient(
//               colors: [Colors.transparent, Colors.black54],
//               stops: [0.5, 1.0],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               tileMode: TileMode.repeated,
//             ),
//           ),
//           // child: BackdropFilter(
//           //   filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
//           //   child: Container(
//           //     decoration: BoxDecoration(
//           //       color: color.colorofScaffold().withOpacity(
//           //             0.35,
//           //           ),
//           //     ),
//           //   ),
//           // ),
//         ),
//         Positioned(
//           left: 16.0,
//           right: 16.0,
//           bottom: 16.0,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: const [],
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   double get maxExtent => height;

//   @override
//   double get minExtent => height;

//   double titleOpactiy(double shrinkOffset) {
//     return 1.0 - max(0.0, shrinkOffset) / maxExtent;
//   }

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }
