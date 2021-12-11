import 'package:airplane/controllers/planepage_controllers.dart';
import 'package:airplane/widgets/show_airplane_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AirplaneWatchList extends StatelessWidget {
  const AirplaneWatchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<PlaneControllers>(
        builder: (context, data, _) {
          return ListView.builder(itemBuilder: (context, index) {
            return ChangeNotifierProvider.value(
              value: data.watchLish[index],
              child: const ShowAirPlaneCards(),
            );
          });
        },
      ),
    );
  }
}
