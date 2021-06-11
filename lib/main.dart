import 'package:flutter/material.dart';
import 'package:projet_app_git/models/city_model.dart';
import 'package:projet_app_git/models/trip_model.dart';
import 'package:projet_app_git/providers/city_provider.dart';
import 'package:projet_app_git/providers/trip_provider.dart';
import 'package:projet_app_git/views/city/city_view.dart';
import 'package:provider/provider.dart';
import 'views/home/home_view.dart';
import 'package:projet_app_git/views/404/not_found.dart';

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
  final CityProvider cityProvider = CityProvider();
  final TripProvider tripProvider = TripProvider();
  @override
  void initState() {
    cityProvider.fetchData();
    tripProvider.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CityProvider()),
        ChangeNotifierProvider.value(value: TripProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (_) => HomeView(),
          '/city': (_) => CityView(),
          '/trips': (_) => TripsView(),
          '/trip': (_) => TripView(),
        },
        onUnknownRoute: (_) => MaterialPageRoute(builder: (_) => NotFound()),
      ),
    );
  }
}
