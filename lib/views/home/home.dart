import 'package:flutter/material.dart';
import 'widgets/city_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List cities = [
    {'name': 'Belfast', 'image': 'assets/images/belfast.jpg', 'checked': false},
    {
      'name': 'Bushmills',
      'image': 'assets/images/bushmills.jpg',
      'checked': false
    },
    {
      'name': 'Ballycastle',
      'image': 'assets/images/ballycastle.jpg',
      'checked': false
    },
  ];

// Method to add favorite city with "onTap" star icon

  void switchChecked(city) {
    int index = cities.indexOf(city);
    setState(() {
      cities[index]['checked'] = !cities[index]['checked'];
    });
  }

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
                return CityCard(
                  name: city['name'],
                  image: city['image'],
                  checked: city['checked'],
                  updateChecked: () {
                    switchChecked(city);
                  },
                );
              })
            ],
          )),
    );
  }
}
