import 'package:flutter/material.dart';
import 'package:projet_app_git/models/trip_model.dart';
import 'package:projet_app_git/views/city/widgets/trip_list.dart';
import 'package:projet_app_git/widgets/donegal_drawer.dart';

class TripView extends StatefulWidget {
  static const String routeName = ' /trips';
  final List<Trip> trips;

  const TripView({this.trips});

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
          title: const Text('Mes voyages'),
          bottom: const TabBar(tabs: <Widget>[
            const Tab(
              text: 'À venir',
            ),
            const Tab(text: 'Passés'),
          ]),
        ),
        drawer: const DonagalDrawer(),
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
