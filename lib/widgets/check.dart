// import 'package:airplane/controllers/colormager.dart';
// import 'package:airplane/controllers/typography.dart';
// import 'package:airplane/model/checklist_model.dart';
// import 'package:expansion_tile_card/expansion_tile_card.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';

// class Check extends StatelessWidget {
//   final CheckModel data;
//   const Check({Key? key, required this.data}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final color = Provider.of<ColorManager>(context);
//     final fonts = Provider.of<TypoGraphyOfApp>(context);
//     return Theme(
//       data: ThemeData(
//           brightness: color.darkmode ? Brightness.dark : Brightness.light),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ExpansionTileCard(
//             duration: const Duration(milliseconds: 200),
//             elevationCurve: Curves.decelerate,
//             turnsCurve: Curves.decelerate,
//             title: fonts.heading4(
//               data.,
//               color.textColor(),
//             ),
//             children: data.page
//                 .map(
//                   (e) => ChangeNotifierProvider<SubList>.value(
//                     value: e,
//                     child: Consumer<SubList>(
//                       builder: (ctx, d, _) {
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 8.0, vertical: 4.0),
//                           child: ListTile(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15)),
//                             tileColor: color.appBarColorroute(),
//                             title: fonts.body1(e.nya, color.textColor()),
//                             trailing: Icon(
//                               e.select
//                                   ? CupertinoIcons.checkmark_circle_fill
//                                   : CupertinoIcons.check_mark_circled,
//                               color: e.select
//                                   ? color.nowarning()
//                                   : color.iconColor().withOpacity(0.2),
//                             ),
//                             onTap: () => e.isselect(),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 )
//                 .toList()),
//       ),
//     );
//   }
// }

