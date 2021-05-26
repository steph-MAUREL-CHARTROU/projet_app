import 'package:flutter/material.dart';
import 'package:projet_app_git/models/trip_model.dart';
import 'package:projet_app_git/views/city/widgets/trip_list.dart';
import 'package:projet_app_git/widgets/donegal_drawer.dart';

class TripView extends StatefulWidget {
  static const String routeName = ' /trips';
  final List<Trip> trips;

  TripView({this.trips});

  @override
  _TripViewState createState() => _TripViewState();
}

class _TripViewState extends State<TripView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mes voyages'),
        ),
        drawer: DonagalDrawer(),
        body: TripList(
          trips: widget.trips,
        ));
  }
}
