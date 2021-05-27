import 'package:flutter/material.dart';
import 'package:projet_app_git/models/city_model.dart';
import 'package:projet_app_git/models/trip_model.dart';

class TripView extends StatefulWidget {
  final Trip trip;
  final City city;

  TripView({
    this.city,
    this.trip,
  });
  @override
  _TripViewState createState() => _TripViewState();
}

class _TripViewState extends State<TripView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('lolilol'));
  }
}
