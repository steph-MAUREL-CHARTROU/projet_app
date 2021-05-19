import 'package:flutter/material.dart';
//import 'views/city/city.dart';
import 'views/home/home.dart';

main() {
  runApp(AppTrip());
}

class AppTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeView()
        //home: City()
        );
  }
}
