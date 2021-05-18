import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projet_app_git/models/activity_model.dart';

class TripActivityCard extends StatefulWidget {
  final Activity activity;
  final Function deleteTripActivity;

  Color getColor() {
    const colors = [Colors.blue, Colors.red];
    return colors[Random().nextInt(2)];
  }

  TripActivityCard({this.activity, this.deleteTripActivity});

  @override
  _TripActivityCardState createState() => _TripActivityCardState();
}

class _TripActivityCardState extends State<TripActivityCard> {
  Color color;

  @override
  void initState() {
    color = widget.getColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(widget.activity.image),
        ),
        title: Text(widget.activity.name),
        subtitle: Text(widget.activity.city),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            widget.deleteTripActivity(widget.activity.id);
          },
        ),
      ),
    );
  }
}
