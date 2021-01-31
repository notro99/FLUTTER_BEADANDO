import 'package:hello_word_android_studio/models/address.dart';

class Profile {
  int id;
  String name;
  String profession;
  String dob;
  String title;
  String about;
  List<Address> addresses = [];

  Profile({
    this.id = 1,
    this.name = '',
    this.profession = '',
    this.dob = '',
    this.title = '',
    this.about = '',
    this.addresses,
  });

  void addAddress(Address address) {
    addresses.add(address);
  }

  void removeAddress(Address address) {
    addresses.remove(address);
  }

  Map<String, dynamic> toMap() {
    Map map = <String, dynamic>{
      'name': name,
      'profession': profession,
      'dob': dob,
      'title' : title,
      'about' : about,
    };

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}


/*TextEditingController _name;
TextEditingController _profession ;
TextEditingController _dob;
TextEditingController _title;
TextEditingController _about;*/