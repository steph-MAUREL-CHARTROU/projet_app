import 'package:flutter/material.dart';
import 'package:projet_app_git/models/city_model.dart';
import 'package:projet_app_git/models/trip_model.dart';
import 'package:projet_app_git/providers/city_provider.dart';
import 'package:projet_app_git/providers/trip_provider.dart';
import 'package:projet_app_git/views/city/widgets/activity_list.dart';
import 'package:projet_app_git/views/city/widgets/trip_activity_list.dart';
import 'package:projet_app_git/views/city/widgets/trip_overview.dart';
import 'package:projet_app_git/views/home/home_view.dart';
import 'package:projet_app_git/widgets/donegal_drawer.dart';
import 'package:provider/provider.dart';
import '../../models/activity_model.dart';

class CityView extends StatefulWidget {
  static const String routeName = '/city';

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
      city: null,
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

  void saveTrip(String cityName) async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            'Voulez vous sauvegarder votre s??l??ction ?',
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
      // widget.addTrip(mytrip);
      mytrip.city = cityName;
      Provider.of<TripProvider>(context).addTrip(mytrip);
      Navigator.pushNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    String cityName = ModalRoute.of(context).settings.arguments;
    City city = Provider.of<CityProvider>(context).getCityByName(cityName);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organiser mon s??jour'),
      ),
      drawer: const DonagalDrawer(),
      body: Container(
        child: Column(
          children: <Widget>[
            TripOverview(
              cityName: city.name,
              trip: mytrip,
              setDate: setDate,
              amount: amount,
            ),
            Expanded(
              child: index == 0
                  ? ActivityList(
                      activities: city.activities,
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
        onPressed: () {
          saveTrip(city.name);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          const BottomNavigationBarItem(
            icon: const Icon(Icons.map),
            label: ('D??couverte'),
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.stars), label: ('Mes activit??s')),
        ],
        onTap: switchIndex,
      ),
    );
  }
}
