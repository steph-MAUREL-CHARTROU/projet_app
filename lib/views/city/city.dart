import 'package:flutter/material.dart';
import 'package:projet_app_git/views/city/widgets/activity_card.dart';
import '../../models/activity.model.dart';
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
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ActivityCard(activity: widget.activities[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 30);
            },
            itemCount: widget.activities.length,
          )),
    );
  }
}
