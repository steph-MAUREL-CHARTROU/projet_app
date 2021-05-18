import 'package:flutter/material.dart';
import '../../models/city_model.dart';
import 'widgets/city_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List cities = [
    City(name: 'Belfast', image: 'assets/images/belfast.jpg'),
    City(name: 'Ballycastle', image: 'assets/images/ballycastle.jpg'),
    City(name: 'Bushmills', image: 'assets/images/bushmills.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text('AppTrip'),
        actions: <Widget>[Icon(Icons.more_vert)],
      ),
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ...cities.map((city) {
                return CityCard(city: city);
              })
            ],
          )),
    );
  }
}
