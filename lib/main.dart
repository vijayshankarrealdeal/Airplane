import 'package:airplane/controllers/account_controller.dart';
import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/location_controller.dart';
import 'package:airplane/controllers/movie_controllers.dart';
import 'package:airplane/controllers/planepage_controllers.dart';
import 'package:airplane/controllers/tikect_controller.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/navbar/change.dart';
import 'package:airplane/navbar/homepage.dart';
import 'package:airplane/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider<TypoGraphyOfApp>(create: (context) => TypoGraphyOfApp()),
    ChangeNotifierProvider(create: (context) => ColorManager()),
    ChangeNotifierProvider(create: (context) => ChangeofPage()),
    ChangeNotifierProvider<Auth>(create: (context) => Auth()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AccountControllers>(
            create: (context) => AccountControllers()),
        ChangeNotifierProvider<PlaneControllers>(
            create: (context) => PlaneControllers()),
        ChangeNotifierProvider(create: (context) => MovieController()),
        ChangeNotifierProvider<LocationTaker>(
            create: (context) => LocationTaker()),
        ChangeNotifierProvider<TicketsAndMore>(
            create: (context) => TicketsAndMore(context)),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // ignore: deprecated_member_use
            accentColor: color.darkmode ? Colors.blue.shade800 : Colors.black,
            brightness: color.darkmode ? Brightness.dark : Brightness.light,
            primaryColor: Colors.blue.shade800,
          ),
          home: MaterialHomePage()),
    );
  }
}
