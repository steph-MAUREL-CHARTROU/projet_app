import 'package:flutter/material.dart';
import 'package:projet_app_git/models/activity_model.dart';

class TripActiviyList extends StatelessWidget {
  final List<Activity> activities;
  final Function deleteTripActivity;

  TripActiviyList({this.activities, this.deleteTripActivity});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          var activity = activities[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(activity.image),
              ),
              title: Text(activity.name),
              subtitle: Text(activity.city),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  deleteTripActivity(activity.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Activité supprimée'),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 1),
                      action: SnackBarAction(
                        label: 'annuler',
                        textColor: Colors.white,
                        onPressed: () {
                          print('undo');
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
        itemCount: activities.length,
      ),
    );
  }
}
