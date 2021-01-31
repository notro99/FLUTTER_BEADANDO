import 'package:hello_word_android_studio/models/activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
    this.activities,
  });
}

List<Activity> activitiesBudapest = [
  Activity(
    imageUrl: 'assets/images/kep1.jpg',
    name: 'Kirándulás',
    type: 'Gellérthegy',
    startTimes: ['9:00 ', '11:00 '],
    rating: 5,
    price: 3200,
  ),
  Activity(
    imageUrl: 'assets/images/kep2.jpg',
    name: 'Fürdőzés',
    type: 'Wellness',
    startTimes: ['10:00 ', '11:00 '],
    rating: 4,
    price: 2400,
  ),
  Activity(
    imageUrl: 'assets/images/kep3.png',
    name: 'Múzeum látogatás',
    type: 'Kultúra',
    startTimes: ['19:00 ', '20:00 '],
    rating: 3,
    price: 3000,
  ),
];

List<Activity> activitiesSzeged = [
  Activity(
    imageUrl: 'assets/images/borfesztival.jpg',
    name: 'Borfesztivál',
    type: 'Kultúra',
    startTimes: ['9:00 ', '11:00 '],
    rating: 5,
    price: 3200,
  ),
  Activity(
    imageUrl: 'assets/images/muzeum.jpg',
    name: 'Múzeum látogatás',
    type: 'Kultúra',
    startTimes: ['10:00 ', '11:00 '],
    rating: 4,
    price: 2400,
  ),
  Activity(
    imageUrl: 'assets/images/pick.jpg',
    name: 'Kézilabda',
    type: 'Sport',
    startTimes: ['19:00 ', '20:00 '],
    rating: 3,
    price: 3000,
  ),
];

List<Activity> activitiesBecs = [
  Activity(
    imageUrl: 'assets/images/karacsonyivasar.jpg',
    name: 'Vásár',
    type: 'Kikapcsolódás',
    startTimes: ['10:00 ', '11:00 '],
    rating: 5,
    price: 3200,
  ),
  Activity(
    imageUrl: 'assets/images/varosnezes.jpg',
    name: 'Városnézés',
    type: 'Kultúra',
    startTimes: ['10:00 ', '11:00 '],
    rating: 4,
    price: 2400,
  ),
];

List<Activity> activitiesErdely = [
  Activity(
    imageUrl: 'assets/images/erdely1.jpg',
    name: 'Túra',
    type: 'Kirándulás',
    startTimes: ['9:00 ', '11:00 '],
    rating: 5,
    price: 3200,
  ),
  Activity(
    imageUrl: 'assets/images/erdely2.jpg',
    name: 'Túra',
    type: 'Kirándulás',
    startTimes: ['10:00 ', '11:00 '],
    rating: 4,
    price: 2400,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/varos1.jpg',
    city: 'Szeged',
    country: 'Magyarország',
    description: 'Látogass el ide',
    activities: activitiesSzeged,
  ),
  Destination(
    imageUrl: 'assets/images/varos6.jpg',
    city: 'Budapest',
    country: 'Magyarország',
    description: 'Látogass el ide',
    activities: activitiesBudapest,
  ),
  Destination(
    imageUrl: 'assets/images/varos7.jpg',
    city: 'Bécs',
    country: 'Ausztria',
    description: 'Látogass el ide',
    activities: activitiesBecs,
  ),
  Destination(
    imageUrl: 'assets/images/varos8.jpg',
    city: 'Szejkefürdő',
    country: 'Románia',
    description: 'Látogass el ide',
    activities: activitiesErdely,
  ),
];
