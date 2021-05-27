import 'package:flutter/material.dart';
import 'package:projet_app_git/models/city_model.dart';

class TripCityBar extends StatelessWidget {
  final City city;

  TripCityBar({this.city});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              city.image,
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black45,
              padding: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 10,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.chevron_left,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        city.name,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
