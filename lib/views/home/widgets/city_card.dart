import 'package:flutter/material.dart';
import 'package:projet_app_git/models/city_model.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard({this.city});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 150,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Ink.image(
              fit: BoxFit.cover,
              image: AssetImage(city.image),
              child: InkWell(
                onTap: () {},
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Text(
                city.name,
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    backgroundColor: Colors.black54),
              ),
            )
          ],
        ),
      ),
    );
  }
}
