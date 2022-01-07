import 'package:airplane/controllers/colormager.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget bulletPoint(String text, ColorManager color) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 3,
          backgroundColor: color.labeledButtonoutside(),
        ),
        const SizedBox(width: 5),
        Expanded(
          flex: 1,
          child: AutoSizeText(
            text,
            style: GoogleFonts.sourceSansPro(
                color: color.subtitle(),
                fontSize: 15,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5),
          ),
        )
      ],
    ),
  );
}
