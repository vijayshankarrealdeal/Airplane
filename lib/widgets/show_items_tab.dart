import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/model/shop_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowItemInTheTab extends StatelessWidget {
  const ShowItemInTheTab({
    Key? key,
    required this.color,
    required this.international,
    required this.fonts,
  }) : super(key: key);

  final ColorManager color;
  final ShopData international;
  final TypoGraphyOfApp fonts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: color.appBarColor(),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: color.appBarColor(),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(international.img)),
                  borderRadius: BorderRadius.circular(15)),
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    fonts.heading4(international.title, color.textColor()),
                    const SizedBox(height: 10),
                    AutoSizeText(
                      international.content,
                      style: GoogleFonts.sourceSansPro(
                          color: color.textColor(),
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5),
                    ),
                    fonts.button(international.opening, color.textColor()),
                    fonts.caption(
                        international.contanctDetails, color.textColor()),
                    fonts.caption(international.location, color.textColor()),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
