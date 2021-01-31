import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'en.dart';
import 'hu.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  // Segédfüggvény, amivel a BuildContext-ből kikereshetjük a beregisztrált
  // PizzaAppLocalization példányt, amit a rendszer az épp aktuális nyelvvel
  // példányosít
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  // Hozzárendeljük a nyelv kódjához a definiált szövegeket
  static Map<String, Map<String, String>> _localizedValues = {
    'en': ENGLISH_TEXTS,
    'hu': HUNGARIAN_TEXTS,
  };

  // Az aktuális nyelv alapján adjuk vissza  az azonosítóhoz tartozó
// lefordított szöveget.
  String stringById(String id) => _localizedValues[locale.languageCode][id];
/*  'seeAll': 'See all destinations',
  'activities' : 'Activities',
  'whatToSearch' : 'What would you like to search?',
  'checkIt' : 'Visit the place!',
  'hotels' : 'Top rated hotels',
  'night' : 'night',
   'map' : 'Map',
  'destination' : 'Destination',
  'goThere' : 'I want to go there!',
    'noEmpty' : 'can\'t be empty!',
  'name'  : 'Name',
  'profession' : 'Profession',
  'dob' : 'Date of birth',
  'title': 'Job title',
  'about' : 'About me..',
  'writeSomething' : 'Write something!',
  'save' : 'Save',
  'newAddress' : 'New address',
  'city' : 'City',
  'street' : 'Street',
  'houseNumber' : 'House number',
  'cancel' : 'Cancel'
  'person' : 'Person',
  'contactPicker' : 'Invite your friends!'
  'enterNumber':' Please enter a number'
  'friendsNumber' : 'Phone number',
  'contactBook' : 'Contact book',
  'enterName':' Please enter a name',
  'contactName' : 'Contact\'s name',
  'friends' : 'Friends',
  'noContacts' : 'There are no contacts in your phonebook',
  */
  // Az egyes azonosítókhoz metódust rendelünk
  String get seeAll => stringById('seeAll');
  String get activities => stringById('activities');
  String get whatToSearch => stringById('whatToSearch');
  String get checkIt => stringById('checkIt');
  String get hotels => stringById('hotels');
  String get night => stringById('night');
  String get map => stringById('map');
  String get destination => stringById('destination');
  String get goThere => stringById('goThere');

  String get noEmpty => stringById('noEmpty');
  String get name => stringById('name');
  String get profession => stringById('profession');
  String get dob => stringById('dob');
  String get title => stringById('title');
  String get about => stringById('about');
  String get writeSomething => stringById('writeSomething');
  String get save => stringById('save');
  String get newAddress => stringById('newAddress');
  String get city => stringById('city');
  String get street => stringById('street');
  String get houseNumber => stringById('houseNumber');
  String get cancel => stringById('cancel');
  String get person => stringById('person');
  String get contactPicker => stringById('contactPicker');
  String get enterNumber => stringById('enterNumber');
  String get friendsNumber => stringById('friendsNumber');
  String get contactBook => stringById('contactBook');
  String get enterName => stringById('enterName');
  String get contactName => stringById('contactName');
  String get friends => stringById('friends');
  String get noContacts => stringById('noContacts');


}

// Segédosztály, ami az aktuális nyelv alapján hoz létre egy
// PizzaAppLocalizations példányt, amit majd a widget-ekben elérhetünk
// a BuildContext-en keresztül
class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'hu'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(
      AppLocalizations(locale),
    );
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
