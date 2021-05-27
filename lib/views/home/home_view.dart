import 'package:flutter/material.dart';
import 'package:projet_app_git/widgets/ask_modal.dart';
import 'package:projet_app_git/widgets/donegal_drawer.dart';
import '../../models/city_model.dart';
import 'widgets/city_card.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/';
  final List<City> cities;

  HomeView({this.cities});

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Up Donegal App'),
      ),
      drawer: DonagalDrawer(),
      body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ...widget.cities.map((city) {
                return CityCard(city: city);
              }),
              ElevatedButton(
                  child: Text('modal'),
                  onPressed: () {
                    openModal(context);
                  })
            ],
          )),
    );
  }
}
