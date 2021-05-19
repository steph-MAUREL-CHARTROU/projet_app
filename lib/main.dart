import 'package:flutter/material.dart';
import 'package:projet_app_git/views/city/city_view.dart';

import 'views/home/home_view.dart';

main() {
  runApp(AppTrip());
}

class AppTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, home: HomeView(),
      routes: {
        '/city': (context) {
          return CityView();
        }
      },
      //home: City()
    );
  }
}
