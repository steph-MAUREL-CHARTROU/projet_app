import 'package:flutter/material.dart';
import 'package:projet_app_git/models/city_model.dart';
import 'package:projet_app_git/models/trip_model.dart';
import 'package:projet_app_git/providers/city_provider.dart';
import 'package:projet_app_git/providers/trip_provider.dart';
import 'package:projet_app_git/views/trip/widgets/trip_activities.dart';
import 'package:projet_app_git/views/trip/widgets/trip_city_bar.dart';
import 'package:provider/provider.dart';

import 'widgets/trip_weather.dart';

class TripView extends StatelessWidget {
  static const String routeName = '/trip';
  @override
  Widget build(BuildContext context) {
    final String cityName = (ModalRoute.of(context).settings.arguments
        as Map<String, String>)['cityName'];
    final String tripId = (ModalRoute.of(context).settings.arguments
        as Map<String, String>)['tripId'];

    final City city = Provider.of<CityProvider>(context, listen: false)
        .getCityByName(cityName);

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                TripCityBar(
                  city: city,
                ),
                // TripWeather(
                //   cityName: cityName,
                // ),
                TripActivities(
                  tripId: tripId,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
