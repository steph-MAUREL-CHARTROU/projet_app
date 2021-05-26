import 'package:flutter/material.dart';
import 'package:projet_app_git/models/city_model.dart';
import 'package:projet_app_git/models/trip_model.dart';
import 'package:projet_app_git/views/city/city_view.dart';
import 'views/home/home_view.dart';
import 'package:projet_app_git/views/404/not_found.dart';
import './datas/data.dart' as data;

import 'views/trips/trips_view.dart';

main() {
  runApp(AppTrip());
}

class AppTrip extends StatefulWidget {
  final List<City> cities = data.cities;

  @override
  _AppTripState createState() => _AppTripState();
}

class _AppTripState extends State<AppTrip> {
  List<Trip> trips = [
    Trip(
        activities: [],
        city: 'Belfast',
        date: DateTime.now().add(Duration(days: 1))),
    Trip(
        activities: [],
        city: 'Ballycastle',
        date: DateTime.now().add(Duration(days: 2))),
    Trip(
        activities: [],
        city: 'Bushmills',
        date: DateTime.now().subtract(Duration(days: 2))),
  ];

  void addTrip(Trip trip) {
    setState(() {
      trips.add(trip);
    });
    print(trips);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) {
          return HomeView(cities: widget.cities);
        },
        // '/city': (context) {
        //   return CityView();
        // }
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/city':
            {
              return MaterialPageRoute(
                builder: (contexte) {
                  final City city = settings.arguments;
                  return CityView(city: city, addTrip: addTrip);
                },
              );
            }
          case '/trips':
            {
              return MaterialPageRoute(builder: (contexte) {
                return TripView(trips: trips);
              });
            }
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return NotFound();
        });
      },
      //home: City()
    );
  }
}
