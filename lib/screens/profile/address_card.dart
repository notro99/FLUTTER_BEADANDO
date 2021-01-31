import 'package:flutter/material.dart';
import 'package:hello_word_android_studio/l10n/app_localization.dart';
import 'package:hello_word_android_studio/models/address.dart';
import 'package:hello_word_android_studio/screens/profile/address_map.dart';

class AddressCard extends StatelessWidget {
  final Address address;

  AddressCard({Key key, this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('${AppLocalizations.of(context).city}: '),
                Text(address.city),
              ],
            ),
            Row(
              children: <Widget>[
                Text('${AppLocalizations.of(context).street}: '),
                Text(address.street),
              ],
            ),
            Row(
              children: <Widget>[
                Text('${AppLocalizations.of(context).houseNumber}: '),
                Text(address.houseNumber),
              ],
            ),
            AddressMap(address: address),
          ],
        ),
      ),
    );
  }
}
