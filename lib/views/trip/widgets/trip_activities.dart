import 'package:flutter/material.dart';
import 'package:projet_app_git/models/activity_model.dart';
import 'package:projet_app_git/views/trip/widgets/trip_activtities_list.dart';

class TripActivities extends StatelessWidget {
  final String tripId;

  TripActivities({this.tripId});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              child: TabBar(
                indicatorColor: Colors.blue[100],
                tabs: <Widget>[
                  Tab(
                    text: 'À venir',
                  ),
                  Tab(
                    text: 'Passés',
                  ),
                ],
              ),
            ),
            Container(
              height: 600,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  TripActivitiesList(
                    tripId: tripId,
                    filter: ActivityStatus.ongoing,
                  ),
                  TripActivitiesList(
                    tripId: tripId,
                    filter: ActivityStatus.done,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
