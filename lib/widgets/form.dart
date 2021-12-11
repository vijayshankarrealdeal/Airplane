import 'package:airplane/controllers/colormager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormForApp extends StatelessWidget {
  final TextEditingController? email;
  final String? placeholder;
  final bool hideText;
  final TextInputAction type;
  final VoidCallback? callback;
  final Function? change;
  final int maxLength;
  final int maxLines;
  final int minLines;
  final bool addWordCount;
  final Widget? prefix;

  const FormForApp(
      {Key? key,
      this.addWordCount = true,
      this.maxLength = 100,
      this.prefix,
      this.minLines = 1,
      this.change,
      this.maxLines = 1,
      this.callback,
      this.type = TextInputAction.next,
      this.hideText = false,
      this.email,
      this.placeholder})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorManager>(builder: (context, colorX, _) {
      return TextField(
        onChanged: (s) => change!(s),
        maxLength: maxLength,
        maxLines: maxLines,
        minLines: minLines,
        onEditingComplete: () => callback!(),
        obscureText: hideText,
        style: TextStyle(color: colorX.textColor()),
        decoration: InputDecoration(
          counterText: addWordCount ? null : "",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorX.textColor()),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorX.textColor()),
          ),
          hintText: placeholder,
          hintStyle: GoogleFonts.sourceSansPro(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
            color: colorX.formPlaceholder(),
          ),
        ),
        controller: email,
        textInputAction: type,
      );
    });
  }
}
