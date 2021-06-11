import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projet_app_git/models/activity_model.dart';
import 'package:projet_app_git/models/trip_model.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class TripProvider with ChangeNotifier {
  final String host = 'http://10.0.2.2';
  List<Trip> _trips = [];
  bool isLoading = false;
  UnmodifiableListView<Trip> get trips => UnmodifiableListView(_trips);

  Future<void> fetchData() async {
    try {
      isLoading = true;
      http.Response response =
          await http.get(Uri.parse('http://10.0.2.2:8080/api/trips'));
      if (response.statusCode == 200) {
        _trips = (json.decode(response.body) as List)
            .map((tripJson) => Trip.fromJson(tripJson))
            .toList();
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }

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
