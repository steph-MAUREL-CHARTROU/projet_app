import 'package:flutter/material.dart';
import 'package:projet_app_git/providers/city_provider.dart';
import 'package:projet_app_git/widgets/ask_modal.dart';
import 'package:projet_app_git/widgets/donegal_drawer.dart';
import 'package:provider/provider.dart';
import '../../models/city_model.dart';
import 'widgets/city_card.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/';

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeView> {
  openModal(context) {
    askModal(context, 'want something ?').then((result) {
      print(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<City> cities = Provider.of<CityProvider>(context).cities;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Up Donegal App'),
      ),
      drawer: DonagalDrawer(),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: cities.map(
            (city) {
              return CityCard(
                city: city,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
