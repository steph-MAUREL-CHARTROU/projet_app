import 'package:flutter/material.dart';
import 'package:projet_app_git/models/activity_model.dart';

class Trip {
  String city;
  List<Activity> activities;
  DateTime date;
  Trip({
    @required this.activities,
    @required this.city,
    @required this.date,
  });
}
