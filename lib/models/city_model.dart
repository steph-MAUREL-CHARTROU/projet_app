import 'package:flutter/material.dart';
import 'package:projet_app_git/models/activity_model.dart';

class City {
  String image;
  String name;
  List<Activity> activities;
  City({
    @required this.image,
    @required this.name,
    @required this.activities,
  });
}
