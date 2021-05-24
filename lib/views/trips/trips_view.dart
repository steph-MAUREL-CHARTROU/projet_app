import 'package:flutter/material.dart';

class TripView extends StatefulWidget {
  static String routeName = ' /trips';
  @override
  _TripViewState createState() => _TripViewState();
}

class _TripViewState extends State<TripView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('trips'),
    );
  }
}
