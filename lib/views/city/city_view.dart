import 'package:flutter/material.dart';
import 'package:projet_app_git/models/trip_model.dart';
import 'package:projet_app_git/views/city/widgets/activity_card.dart';
import 'package:projet_app_git/views/city/widgets/trip_overview.dart';
import '../../models/activity_model.dart';
import '../../datas/data.dart' as data;

class CityView extends StatefulWidget {
  final List<Activity> activities = data.activities;

  _CityState createState() => _CityState();
}

class _CityState extends State<CityView> {
  Trip mytrip = Trip(activities: [], city: 'Belfast', date: DateTime.now());

  void setDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2022),
    ).then((newDate) {
      if (newDate != null) {
        setState(() {
          mytrip.date = newDate;
        });
      }
    });
  }

  // void switchIndex(newIndex) {
  //   setState(() {
  //     index = newIndex;
  //   });
  // }

  // void toggleActivity(String id) {
  //   setState(() {
  //     mytrip.activities.contains(id)
  //         ? mytrip.activities.remove(id)
  //         : mytrip.activities.add(id);
  //   });
  // }

  void deleteTripActivity(String id) {
    setState(() {
      mytrip.activities.remove(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('Organiser mon séjour'),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TripOverview(
              trip: mytrip,
              setDate: setDate,
            ),
            Expanded(
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
            )
          ],
        ),
      ),
    );
  }
}
