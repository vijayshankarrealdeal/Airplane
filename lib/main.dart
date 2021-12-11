import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/planepage_controllers.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/navbar/change.dart';
import 'package:airplane/navbar/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider<TypoGraphyOfApp>(create: (context) => TypoGraphyOfApp()),
    ChangeNotifierProvider(create: (context) => ColorManager()),
    ChangeNotifierProvider(create: (context) => ChangeofPage()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ChangeNotifierProvider<PlaneControllers>(
        create: (context) => PlaneControllers(),
        child: MaterialHomePage(),
      ),
    );
  }
}
