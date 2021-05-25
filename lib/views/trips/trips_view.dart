import 'package:flutter/material.dart';
import 'package:projet_app_git/widgets/donegal_drawer.dart';

class TripView extends StatefulWidget {
  static const String routeName = ' /trips';
  @override
  _TripViewState createState() => _TripViewState();
}

class _TripViewState extends State<TripView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes voyages'),
      ),
      drawer: DonagalDrawer(),
      body: Container(
        alignment: Alignment.center,
        child: Text('Trips'),
      ),
    );
  }
}
