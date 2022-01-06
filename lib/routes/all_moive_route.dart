import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/movie_controllers.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoreMovies extends StatelessWidget {
  const MoreMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    return Scaffold(
      backgroundColor: color.colorofScaffoldroute(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: fonts.heading5("Movies for You", color.textColor()),
        iconTheme: IconThemeData(
          color: color.backButton(), //change your color here
        ),
        backgroundColor: color.appBarColorroute(),
      ),
      body: Consumer<MovieController>(
        builder: (contex, movie, _) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 12,
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              mainAxisSpacing: 12,
            ),
            itemCount: movie.result.length,
            itemBuilder: (context, index) {
              return GridTile(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              'http://image.tmdb.org/t/p/w500' +
                                  movie.result[index].posterPath.toString(),
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.black.withOpacity(0.5),
                        radius: 30,
                        child: const Center(
                          child: Icon(
                            CupertinoIcons.play,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // footer: Container(
                //   decoration: BoxDecoration(
                //     color: Colors.black.withOpacity(0.5),
                //   ),
                //   child: Row(
                //     children: [
                //       fonts.body2(
                //           "Rating-" +
                //               movie.result[index].voteAverage.toString(),
                //           Colors.white),
                //     ],
                //   ),
                // ),
              );

              // Stack(
              //   children: [
              //     Center(
              //       child: ClipRRect(
              //         child: BackdropFilter(
              //           filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
              //           child: Container(
              //             width: MediaQuery.of(context).size.width,
              //             height: MediaQuery.of(context).size.height,
              //             decoration: BoxDecoration(
              //                 color: Colors.black.withOpacity(0.5)),
              //             child: Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 crossAxisAlignment: CrossAxisAlignment.center,
              //                 children: [
              //                   fonts.heading2(movie.result[index].title ?? '',
              //                       Colors.white),
              //                   fonts.heading1(
              //                       movie.result[index].voteAverage.toString(),
              //                       Colors.white)
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // );
            },
          );
        },
      ),
    );
  }
}
