import 'package:flutter/material.dart';
import 'package:projet_app/views/city/widgets/city.dart';
// import 'views/home/home.dart';

main() {
  runApp(AppTrip());
}

class AppTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: Home(),
        home: City());
  }
}
