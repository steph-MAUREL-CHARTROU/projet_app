import 'package:flutter/material.dart';
import 'package:projet_app_git/providers/city_provider.dart';
import 'package:projet_app_git/widgets/app_loader.dart';
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
  CityProvider cp = new CityProvider();
  List<City> cities = [];

  @override
  void initState() {
    super.initState();
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
          child: RefreshIndicator(
            onRefresh: Provider.of<CityProvider>(context).fetchData,
            child: cities.length > 0
                ? ListView.builder(
                    itemCount: cities.length,
                    itemBuilder: (_, i) => CityCard(
                      city: cities[i],
                    ),
                  )
                : AppLoader(),
          ),
        ));
  }
}
