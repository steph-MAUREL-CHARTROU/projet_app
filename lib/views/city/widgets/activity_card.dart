import 'package:flutter/material.dart';

import '../../../models/activity.model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  ActivityCard({this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(activity.image),
        ),
        title: Text(activity.name),
        subtitle: Text(activity.city),
        trailing: Checkbox(
          value: false,
          tristate: false,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
