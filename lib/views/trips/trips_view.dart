import 'package:flutter/material.dart';
import 'package:projet_app_git/models/trip_model.dart';
import 'package:projet_app_git/providers/trip_provider.dart';
import 'package:projet_app_git/views/city/widgets/trip_list.dart';
import 'package:projet_app_git/widgets/app_loader.dart';
import 'package:projet_app_git/widgets/donegal_drawer.dart';
import 'package:provider/provider.dart';

class TripsView extends StatelessWidget {
  //static const String routeName = '/trips';
  @override
  Widget build(BuildContext context) {
    List<Trip> trips = Provider.of<TripProvider>(context).trips;
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
        body: trips.length > 0
            ? TabBarView(
                children: <Widget>[
                  TripList(
                    trips: trips
                        .where((trip) => DateTime.now().isBefore(trip.date))
                        .toList(),
                  ),
                  TripList(
                    trips: trips
                        .where((trip) => DateTime.now().isAfter(trip.date))
                        .toList(),
                  ),
                ],
              )
            : AppLoader(),
      ),
    );
  }
}
