import 'package:flutter/material.dart';
import 'package:projet_app_git/models/city_model.dart';
import 'package:projet_app_git/views/city/city_view.dart';
import 'views/home/home_view.dart';
import 'package:projet_app_git/views/404/not_found.dart';

main() {
  runApp(AppTrip());
}

class AppTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) {
          return HomeView();
        },
        // '/city': (context) {
        //   return CityView();
        // }
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/city') {
          final City city = settings.arguments;
          return MaterialPageRoute(builder: (contexte) {
            return CityView(
              city: city,
            );
          });
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
