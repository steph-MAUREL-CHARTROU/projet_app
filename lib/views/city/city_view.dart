import 'package:flutter/material.dart';
import 'package:projet_app_git/models/city_model.dart';
import 'package:projet_app_git/models/trip_model.dart';
import 'package:projet_app_git/views/city/widgets/activity_list.dart';
import 'package:projet_app_git/views/city/widgets/trip_activity_list.dart';
import 'package:projet_app_git/views/city/widgets/trip_overview.dart';
import 'package:projet_app_git/views/home/home_view.dart';
import 'package:projet_app_git/widgets/donegal_drawer.dart';
import '../../models/activity_model.dart';

class CityView extends StatefulWidget {
  static const String routeName = '/city';
  final City city;
  final Function addTrip;

  List<Activity> get activities {
    return city.activities;
  }

  CityView({this.city, this.addTrip});

  _CityState createState() => _CityState();
}

class _CityState extends State<CityView> {
  Trip mytrip;
  int index;

  @override
  void initState() {
    super.initState();
    mytrip = Trip(activities: [], city: 'Belfast', date: null);
    index = 0;
  }

  List<Activity> get tripActivities {
    return widget.activities
        .where((activity) => mytrip.activities.contains(activity.id))
        .toList();
  }

  double get amount {
    return mytrip.activities.fold(0.0, (prev, element) {
      var activity =
          widget.activities.firstWhere((activity) => activity.id == element);
      return prev + activity.price;
    });
  }

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

  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  void toggleActivity(String id) {
    setState(() {
      mytrip.activities.contains(id)
          ? mytrip.activities.remove(id)
          : mytrip.activities.add(id);

      print(mytrip.activities);
    });
  }

  void deleteTripActivity(String id) {
    setState(() {
      mytrip.activities.remove(id);
    });
  }

  void saveTrip() async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            'Voulez vous sauvegarder votre séléction ?',
          ),
          contentPadding: EdgeInsets.all(20),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'cancel');
                  },
                  child: Text('Annuler'),
                ),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'save');
                  },
                  child: Text('Sauvegarder'),
                ),
              ],
            )
          ],
        );
      },
    );
    print(result);
    if (result == 'save') {
      widget.addTrip(mytrip);
      Navigator.pushNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final City city = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Organiser mon séjour'),
      ),
      drawer: DonagalDrawer(),
      body: Container(
        child: Column(
          children: <Widget>[
            TripOverview(
              cityName: widget.city.name,
              trip: mytrip,
              setDate: setDate,
              amount: amount,
            ),
            Expanded(
              child: index == 0
                  ? ActivityList(
                      activities: widget.activities,
                      selectedActivities: mytrip.activities,
                      toggleActivity: toggleActivity,
                    )
                  : TripActiviyList(
                      activities: tripActivities,
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.forward),
        onPressed: saveTrip,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: ('Découverte'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.stars), label: ('Mes activités')),
        ],
        onTap: switchIndex,
      ),
    );
  }
}
