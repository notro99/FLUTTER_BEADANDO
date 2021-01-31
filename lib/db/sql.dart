import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'dart:async';

/*
TextEditingController _name;
TextEditingController _profession ;
TextEditingController _dob;
TextEditingController _title;
TextEditingController _about;*/

class Sql {
  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await openDatabase(
      join(
        await getDatabasesPath(),
        'profile.db',
      ),
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE profile(
          id INTEGER PRIMARY KEY,
          name TEXT,
          profession TEXT,
          dob TEXT,
          title TEXT,
          about TEXT
        );
        ''');
        await db.execute('''
        CREATE TABLE addresses(
          id INTEGER PRIMARY KEY,
          city TEXT,
          street TEXT,
          houseNumber TEXT,
          lat REAL,
          lng REAL
        );
        ''');
      },
    );
    print(join(
      await getDatabasesPath(),
      'profile.db',
    ));
    return _database;
  }
}
