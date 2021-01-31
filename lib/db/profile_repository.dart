import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hello_word_android_studio/db/sql.dart';
import 'package:hello_word_android_studio/location_service.dart';
import 'package:hello_word_android_studio/models/address.dart';
import 'package:hello_word_android_studio/models/profile.dart';
import 'package:sqflite/sqlite_api.dart';

class ProfileRepository {
  final Sql sql;

  ProfileRepository({this.sql});

  Future<Profile> load() async {
    Profile profile = Profile();

    // Referencia az adatbázisunkra
    final Database database = await sql.database;

    // Egy elem betöltése a profile táblából
    List<Map<String, dynamic>> result =
        await database.query('profile', limit: 1);

    if (result.length > 0) {
      // Volt találat, betöltjük az adatokat
      var data = result.first;
      profile.id = data['id'];
      profile.name = data['name'];
      profile.profession = data['profession'];
      profile.dob = data['dob'];
      profile.title = data['title'];
      profile.about = data['about'];

      profile.addresses.addAll(await loadAllAddresses(sql));
    }
    return profile;
  }

  Future<List<Address>> loadAllAddresses(Sql sql) async {
    final Database database = await sql.database;
    // Az összes cím betöltése az adresses táblából
    final List<Map<String, dynamic>> result = await database.query(
      'addresses',
      orderBy: 'id DESC',
    );

    // Átalakítjuk az adatot Address objektumokká
    return List.generate(result.length, (i) {
      return Address(
          id: result[i]['id'],
          city: result[i]['city'],
          street: result[i]['street'],
          houseNumber: result[i]['houseNumber'],
          latLng: LatLng(result[i]['lat'] ?? SZEGED_LATLNG.latitude,
              result[i]['lng'] ?? SZEGED_LATLNG.longitude));
    });
  }

  Future<void> save(Profile profile) async {
    final Database database = await sql.database;
    // Profil mentése az adazbázisba. Ha már létezett, akkor felülírjuk
    profile.id = await database.insert('profile', profile.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

   /* removeAllAddresses();
    profile.addresses.forEach((address) {
      addAddress(address);
    });*/
  }

  Future<void> addAddress(Address address) async {
    final Database database = await sql.database;
    address.id = await database.insert(
      'addresses',
      address.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> removeAllAddresses() async {
    final Database database = await sql.database;
    database.delete('addresses');
  }

  Future<void> removeAddress(Address address) async {
    final Database database = await sql.database;
    database.delete(
      'addresses',
      where: 'id = ?',
      whereArgs: [address.id],
    );
  }
}
