import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_word_android_studio/l10n/app_localization.dart';
import 'package:hello_word_android_studio/models/activity_model.dart';
import 'package:hello_word_android_studio/models/destination_model.dart';

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/images/kep1.jpg',
    name: 'Tevekenyseg1',
    type: 'Kirandulas',
    startTimes: ['9:00 ', '11:00 '],
    rating: 5,
    price: 3200,
  ),
  Activity(
    imageUrl: 'assets/images/kep2.jpg',
    name: 'Tevekenyseg2',
    type: 'Kirandulas',
    startTimes: ['10:00 ', '11:00 '],
    rating: 4,
    price: 2400,
  ),
  Activity(
    imageUrl: 'assets/images/kep3.png',
    name: 'Tevekenyseg3',
    type: 'Kirandulas',
    startTimes: ['19:00 ', '20:00 '],
    rating: 3,
    price: 3000,
  ),
];

List<Destination> alldestinations = [
  Destination(
    imageUrl: 'assets/images/varos1.jpg',
    city: 'Szeged',
    country: 'Magyarország',
    description: 'Latogass el ide',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/varos2.jpg',
    city: 'Békéscsaba',
    country: 'Magyarország',
    description: 'Latogass el ide',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/varos3.jpg',
    city: 'Pécs',
    country: 'Magyarország',
    description: 'Latogass el ide',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/varos4.jpg',
    city: 'Gyula',
    country: 'Magyarország',
    description: 'Latogass el ide',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/varos5.jpg',
    city: 'Sopron',
    country: 'Magyarország',
    description: 'Latogass el ide',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/varos6.jpg',
    city: 'Budapest',
    country: 'Magyarország',
    description: 'Latogass el ide',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/varos7.jpg',
    city: 'Bécs',
    country: 'Ausztria',
    description: 'Latogass el ide',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/varos8.jpg',
    city: 'Szejkefürdő',
    country: 'Románia',
    description: 'Latogass el ide',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/varos9.jpg',
    city: 'Pozsony',
    country: 'Szlovákia',
    description: 'Latogass el ide',
    activities: activities,
  )
];

class AllDestinationScreen extends StatefulWidget {
  final Destination destination;

  AllDestinationScreen({this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<AllDestinationScreen> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: alldestinations.length,
              itemBuilder: (BuildContext context, int index) {
                Destination destination = alldestinations[index];
                return Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      height: 170.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(120.0, 20.0, 20.0, 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 80.0,
                                  child: Text(
                                    destination.city,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      destination.country,
                                      style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              AppLocalizations.of(context).checkIt,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.0,
                      top: 15.0,
                      bottom: 15.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          width: 130.0,
                          image: AssetImage(
                            destination.imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
