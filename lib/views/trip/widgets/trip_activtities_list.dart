import 'package:flutter/material.dart';
import 'package:projet_app_git/models/activity_model.dart';

class TripActivitiesList extends StatelessWidget {
  final List<Activity> activities;

  TripActivitiesList({this.activities});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, i) => Text(activities[i].name),
    );
  }
}
