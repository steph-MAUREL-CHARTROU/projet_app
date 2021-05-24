import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projet_app_git/models/trip_model.dart';

class TripOverview extends StatelessWidget {
  final Function setDate;
  final Trip trip;
  final String cityName;
  final double amount;

  TripOverview({
    this.trip,
    this.setDate,
    this.cityName,
    this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          height: 150,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                cityName,
                style: TextStyle(
                  fontSize: 25,
                  decoration: TextDecoration.underline,
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      trip.date != null
                          ? DateFormat("d/M/y").format(trip.date)
                          : (' choisissez une date'),
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  ElevatedButton(
                    child: Text('Séléctionner une date'),
                    onPressed: setDate,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(children: <Widget>[
                Expanded(
                  child:
                      Text('Montant /personne', style: TextStyle(fontSize: 20)),
                ),
                Text(
                  '$amount €',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ]),
            ],
          ),
        ),
      ],
    ));
  }
}
