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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mes voyages'),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              text: 'À venir',
            ),
            Tab(text: 'Passés'),
          ]),
        ),
        drawer: DonagalDrawer(),
        body: TabBarView(
          children: <Widget>[
            TripList(
              trips: widget.trips
                  .where((trip) => DateTime.now().isBefore(trip.date))
                  .toList(),
            ),
            TripList(
              trips: widget.trips
                  .where((trip) => DateTime.now().isAfter(trip.date))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
