import 'package:projet_app_git/models/activity_model.dart';
import 'package:projet_app_git/models/city_model.dart';

List<City> cities = [
  ////////////////////////////////////Belfast/////////////////////////////////////////////////
  City(name: 'Belfast', image: 'assets/images/belfast.jpg', activities: [
    Activity(
      image: 'assets/images/activities/botanic_garden.jpeg',
      name: 'Botanic Garden',
      id: 'bel1',
      city: 'Belfast',
      price: 0.00,
    ),
    Activity(
      image: 'assets/images/activities/market.jpg',
      name: 'Saint George s Market',
      id: 'bel2',
      city: 'Belfast',
      price: 0.00,
    ),
    Activity(
      image: 'assets/images/activities/crumlin.jpeg',
      name: 'Crumlin road',
      id: 'bel3',
      city: 'Belfast',
      price: 10.00,
    ),
    Activity(
      image: 'assets/images/activities/castle.jpg',
      name: 'Belfast Castle',
      id: 'bel4',
      city: 'Belfast',
      price: 6.00,
    ),
    Activity(
      image: 'assets/images/activities/cranes.jpg',
      name: 'David & Goliath cranes',
      id: 'bel5',
      city: 'Belfast',
      price: 0.00,
    ),
    Activity(
      image: 'assets/images/activities/titanic.jpg',
      name: 'Titanic Museum',
      id: 'bel6',
      city: 'Belfast',
      price: 18.00,
    ),
    Activity(
      image: 'assets/images/activities/ulstermuseum.jpg',
      name: 'Ulster Museum',
      id: 'bel7',
      city: 'Belfast',
      price: 0.00,
    ),
    Activity(
      image: 'assets/images/activities/victoriasquare.jpg',
      name: 'Victoria s Square',
      id: 'bel8',
      city: 'Belfast',
      price: 0.00,
    ),
    Activity(
      image: 'assets/images/activities/murals.jpg',
      name: 'Murals',
      id: 'bel9',
      city: 'Belfast',
      price: 10.00,
    ),
    /////////////////////////////////////////////Ballycastle///////////////////////////////
  ]),
  City(
    name: 'Ballycastle',
    image: 'assets/images/ballycastle.jpg',
    activities: [
      Activity(
        image: 'assets/images/activities/beach.jpg',
        name: 'Beach',
        id: 'bally1',
        city: 'Ballycastle',
        price: 0.00,
      ),
      Activity(
        image: 'assets/images/activities/torrhead.jpg',
        name: 'Torr Head',
        id: 'bally2',
        city: 'Ballycastle',
        price: 0.00,
      ),
    ],
    /////////////////////////////////////////////Bushmills///////////////////////////////////
  ),
  City(
    name: 'Bushmills',
    image: 'assets/images/bushmills.jpg',
    activities: [
      Activity(
        image: 'assets/images/activities/distillery.jpg',
        name: 'Old Bushmills Distillery',
        id: 'bush1',
        city: 'Bushmills',
        price: 16.00,
      ),
      Activity(
        image: 'assets/images/activities/giantCauseway.jpg',
        name: 'La chaussée des Géants',
        id: 'bush2',
        city: 'Bushmills',
        price: 6.00,
      ),
    ],
  ),
];
