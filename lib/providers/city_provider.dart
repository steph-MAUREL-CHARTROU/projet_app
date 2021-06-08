import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:projet_app_git/models/city_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CityProvider with ChangeNotifier {
  final List<City> _cities = [];

  UnmodifiableListView<City> get cities => UnmodifiableListView(_cities);

  City getCityByName(String cityName) =>
      cities.firstWhere((city) => city.name == cityName);

  fetchData() async {
    try {
      http.Response response =
          await http.get(Uri.parse('http:/10.0.2.2:80/api/cities'));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
      }
    } catch (e) {
      rethrow;
    }
  }
}
