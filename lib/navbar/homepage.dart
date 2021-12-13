import 'package:airplane/app/account.dart';
import 'package:airplane/app/home.dart';
import 'package:airplane/app/listen.dart';
import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/navbar/bottom_navigation_bar.dart';
import 'package:airplane/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'change.dart';

class MaterialHomePage extends StatelessWidget {
  final List<Widget> children = [
    const Home(),
    const ListenPage(),
    const Account(),
    //  const AddStatusQuestions()
  ];

  MaterialHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<ChangeofPage>(context);
    final color = Provider.of<ColorManager>(context);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color.appBarColor(),
      systemNavigationBarIconBrightness:
          color.darkmode ? Brightness.dark : Brightness.light,
      statusBarBrightness: color.darkmode ? Brightness.dark : Brightness.light,
    ));
    return SafeArea(
      child: Scaffold(
        endDrawer: const GetDrawer(),
        key: _scaffoldKey,
        backgroundColor: color.colorofScaffold(),
        body: children[nav.pageIndex],
        bottomNavigationBar: const MaterialBottomNavigationBar(),
      ),
    );
  }
}
