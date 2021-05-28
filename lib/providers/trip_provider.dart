import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:projet_app_git/models/trip_model.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:projet_app_git/datas/data.dart' as data;

class TripProvider with ChangeNotifier {
  final List<Trip> _trips = data.trips;

  UnmodifiableListView<Trip> get trips => UnmodifiableListView(_trips);

  void addTrip(Trip trip) {
    _trips.add(trip);
    notifyListeners();
  }
}
