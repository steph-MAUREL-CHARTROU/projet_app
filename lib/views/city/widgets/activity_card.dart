import 'package:flutter/material.dart';

import '../../../models/activity_model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  ActivityCard({this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Image.asset(activity.image, fit: BoxFit.cover),
    );
  }
}
