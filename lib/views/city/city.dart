import 'package:flutter/material.dart';
import 'package:projet_app_git/views/city/widgets/activity_card.dart';
import '../../models/activity_model.dart';
import '../../datas/data.dart' as data;

class City extends StatefulWidget {
  final List<Activity> activities = data.activities;
  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left),
        title: Text('Belfast'),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView.count(
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          crossAxisCount: 2,
          children: widget.activities
              .map((activity) => ActivityCard(
                    activity: activity,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
