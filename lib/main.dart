import 'package:flutter/material.dart';
import 'package:projet_app_git/models/city_model.dart';
import 'package:projet_app_git/models/trip_model.dart';
import 'package:projet_app_git/providers/city_provider.dart';
import 'package:projet_app_git/providers/trip_provider.dart';
import 'package:projet_app_git/views/city/city_view.dart';
import 'package:provider/provider.dart';
import 'views/home/home_view.dart';
import 'package:projet_app_git/views/404/not_found.dart';
import './datas/data.dart' as data;

import 'views/trip/trip_view.dart';
import 'views/trips/trips_view.dart';

main() {
  runApp(AppTrip());
}

class AppTrip extends StatefulWidget {
  @override
  _AppTripState createState() => _AppTripState();
}

class _AppTripState extends State<AppTrip> {
  // void addTrip(Trip trip) {
  //   setState(() {
  //     trips.add(trip);
  //   });
  //   print(trips);
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CityProvider()),
        ChangeNotifierProvider.value(value: TripProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeView(), '/city': (context) => CityView(),
          // '/city': (context) {
          //   return CityView();
          // }
        },
        // onGenerateRoute: (settings) {
        //   switch (settings.name) {
        //     case '/city':
        //       {
        //         return MaterialPageRoute(
        //           builder: (contexte) {
        //             final City city = settings.arguments;
        //             return CityView(city: city, addTrip: addTrip);
        //           },
        //         );
        //       }
        //     case '/trips':
        //       {
        //         return MaterialPageRoute(builder: (contexte) {
        //           return TripsView(trips: trips);
        //         });
        //       }
        //     case '/trip':
        //       {
        //         return MaterialPageRoute(builder: (context) {
        //           String tripId =
        //               (settings.arguments as Map<String, String>)['tripId'];
        //           String cityName =
        //               (settings.arguments as Map<String, String>)['cityName'];
        //           return TripView(
        //             trip: trips.firstWhere((trip) => trip.id == tripId),
        //             city:
        //                 widget.cities.firstWhere((city) => city.name == cityName),
        //           );
        //         });
        //       }
        //   }
        // },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (context) {
            return NotFound();
          });
        },
        //home: City()
      ),
    );
  }
}
