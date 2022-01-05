import 'package:airplane/controllers/checklist_controller.dart';
import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/services/auth.dart';
import 'package:airplane/widgets/loading_spinner.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckList extends StatelessWidget {
  final String? pk;
  const CheckList({Key? key, this.pk = ""}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final font = Provider.of<TypoGraphyOfApp>(context);
    final auth = Provider.of<Auth>(context);

    return ChangeNotifierProvider(
      create: (context) => CheckController(auth, pk!),
      child: Consumer<CheckController>(
        builder: (context, datacontrol, _) {
          return Scaffold(
            backgroundColor: color.colorofScaffoldroute(),
            appBar: AppBar(
              elevation: 0,
              iconTheme: IconThemeData(
                color: color.backButton(), //change your color here
              ),
              centerTitle: true,
              title: font.heading5("Travel CheckList", color.textColor()),
              backgroundColor: color.appBarColorroute(),
              actions: [
                datacontrol.load
                    ? const CupertinoActivityIndicator()
                    : CupertinoButton(
                        child: font.button(datacontrol.startload ? "" : "Save",
                            color.textColor()),
                        onPressed: () {
                          pk!.isNotEmpty
                              ? datacontrol.addListtodb(pk!, auth)
                              : null;
                        })
              ],
            ),
            body: datacontrol.startload
                ? const LoadingSpinner()
                : ListView(
                    children: datacontrol.mainData
                        .map(
                          (xt) => Theme(
                            data: ThemeData(
                                brightness: color.darkmode
                                    ? Brightness.dark
                                    : Brightness.light),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ExpansionTileCard(
                                duration: const Duration(milliseconds: 200),
                                elevationCurve: Curves.decelerate,
                                turnsCurve: Curves.decelerate,
                                title: font.heading4(
                                  xt.keys.first,
                                  color.textColor(),
                                ),
                                children: xt.values.first
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 4.0),
                                        child: ListTile(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          tileColor: color.appBarColorroute(),
                                          title:
                                              font.body1(e, color.textColor()),
                                          trailing: Icon(
                                            datacontrol.x[xt.keys.first]
                                                    .contains(e)
                                                ? CupertinoIcons
                                                    .checkmark_circle_fill
                                                : CupertinoIcons
                                                    .check_mark_circled,
                                            color: datacontrol.x[xt.keys.first]
                                                    .contains(e)
                                                ? color.nowarning()
                                                : color
                                                    .iconColor()
                                                    .withOpacity(0.2),
                                          ),
                                          onTap: () => datacontrol
                                                  .x[xt.keys.first]
                                                  .contains(e)
                                              ? datacontrol.removeToUi(
                                                  xt.keys.first, e.toString())
                                              : datacontrol.addToUi(
                                                  xt.keys.first, e.toString()),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
          );
        },
      ),
    );
  }
}
