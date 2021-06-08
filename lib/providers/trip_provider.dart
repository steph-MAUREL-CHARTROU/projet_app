import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:projet_app_git/models/activity_model.dart';
import 'package:projet_app_git/models/trip_model.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class TripProvider with ChangeNotifier {
  final List<Trip> _trips = [];

  UnmodifiableListView<Trip> get trips => UnmodifiableListView(_trips);

  void addTrip(Trip trip) {
    _trips.add(trip);
    notifyListeners();
  }

  Trip getById(String tripId) {
    return trips.firstWhere((trip) => trip.id == tripId);
  }

  void setActivityToDone(Activity activity) {
    activity.status = ActivityStatus.done;
    notifyListeners();
  }
}
