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
    mytrip = Trip(
      activities: [],
      city: widget.city.name,
      date: null,
    );
    index = 0;
  }

  double get amount {
    return mytrip.activities.fold(0.0, (prev, element) {
      return prev + element.price;
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

  void toggleActivity(Activity activity) {
    setState(() {
      mytrip.activities.contains(activity)
          ? mytrip.activities.remove(activity)
          : mytrip.activities.add(activity);

      print(mytrip.activities);
    });
  }

  void deleteTripActivity(Activity activity) {
    setState(() {
      mytrip.activities.remove(activity);
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
          contentPadding: const EdgeInsets.all(20),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'cancel');
                  },
                  child: const Text('Annuler'),
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'save');
                  },
                  child: const Text('Sauvegarder'),
                ),
              ],
            )
          ],
        );
      },
    );
    if (mytrip.date == null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('OOPS !'),
              content: Text('Veuillez entrer une date'),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'))
              ],
            );
          });
    } else if (result == 'save') {
      widget.addTrip(mytrip);
      Navigator.pushNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final City city = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organiser mon séjour'),
      ),
      drawer: const DonagalDrawer(),
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
                      activities: mytrip.activities,
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.forward),
        onPressed: saveTrip,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          const BottomNavigationBarItem(
            icon: const Icon(Icons.map),
            label: ('Découverte'),
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.stars), label: ('Mes activités')),
        ],
        onTap: switchIndex,
      ),
    );
  }
}
