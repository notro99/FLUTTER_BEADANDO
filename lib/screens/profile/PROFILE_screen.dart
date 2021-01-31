import 'dart:io';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hello_word_android_studio/l10n/app_localization.dart';
import 'package:hello_word_android_studio/screens/friend_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hello_word_android_studio/db/profile_repository.dart';
import 'package:hello_word_android_studio/models/profile.dart';
import 'package:hello_word_android_studio/screens/profile/add_address_button.dart';


import 'package:provider/provider.dart';

class Page2 extends StatefulWidget {
  final void Function() onShowCart;

  const Page2({
    Key key,
    this.onShowCart,
  }) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Page2> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _name = TextEditingController();
  TextEditingController _profession = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _title = TextEditingController();
  TextEditingController _about = TextEditingController();

  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  Profile _profile;
  ProfileRepository _profileRepository;

  @override
  void initState() {
    super.initState();
    _profileRepository = context.read<ProfileRepository>();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    var loadedProfile = await _profileRepository.load();
    setState(() {
      _profile = Profile();
    });
  }

  void saveProfile(BuildContext context) async {
    var repository = context.read<ProfileRepository>();
    await repository.save(_profile);
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('Mentve'),
        ),
      );
  }

  Widget bottomSheet(){
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(children: <Widget>[
        Text(
          "Válassz képet",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          FlatButton.icon(icon: Icon(Icons.camera),onPressed: (){
              takePhoto(ImageSource.camera);
          },
            label: Text("Camea"),
          ),
          FlatButton.icon(icon: Icon(Icons.image),
          onPressed: (){
            takePhoto(ImageSource.gallery);
          },
            label: Text("Galéria"),
          )

        ],)
      ],
      ),
    );
  }
void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source,

    );
    setState((){
      _imageFile = pickedFile;
    });
}
  @override
  Widget build(BuildContext context) {
    return Form(key: _formKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: ListView(

              children: <Widget>[
                imageProfile(),
                SizedBox(height: 20),
                nameTextField(),
                SizedBox(
                  height: 20,
                ),
                professionTextField(),
                SizedBox(
                  height: 20,
                ),
                dobField(),
                SizedBox(
                  height: 20,
                ),
                titleTextField(),
                SizedBox(
                  height: 20,
                ),
                aboutTextField(),
                SizedBox(
                  height: 20,
                ),
                SizedBox(height: 20,),

                Container(
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _profile.name = _name?.value?.text;
                        _profile.profession = _profession?.value?.text;
                        _profile.dob = _dob?.value?.text;
                        _profile.title = _title?.value?.text;
                        _profile.about = _about?.value?.text;
                        saveProfile(context);
                      }
                    },
                    child: Text(AppLocalizations.of(context).save),
                  ),

                ),
                SizedBox(height: 20,),

                Container(
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    color: Colors.lightBlue,
                    textColor: Colors.white,
                    onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Friend()));
                    },


                    child: Text(AppLocalizations.of(context).friends),
                  ),

                ),

              ],

          ),

        ),
        floatingActionButton: AddAddressButton(
        onAddressSaved: _loadProfile,
      ),
      ),
    );
  }
  Widget imageProfile(){
    return Stack(children: <Widget>[
      CircleAvatar(
        radius: 80.0,
        backgroundImage: _imageFile == null ? AssetImage('assets/images/profile.jpg'):FileImage(File(_imageFile.path)),
      ),
      Positioned(
        bottom: 15.0,
        right: 20.0,
        child: InkWell(
            onTap: (){
              showModalBottomSheet(context: context, builder: ((builder) => bottomSheet()),);
            },
            child: Icon(Icons.camera_alt, color: Colors.black, size: 28.0)),
      )
    ],);
  }


  Widget nameTextField() {
    return TextFormField(
      controller: _name,
      validator: (value) {
        if (value.isEmpty) return 'Text(AppLocalizations.of(context).name +  AppLocalizations.of(context).noEmpty)';

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.cyan,
        ),
        labelText: AppLocalizations.of(context).name,
        helperText: AppLocalizations.of(context).name +  AppLocalizations.of(context).noEmpty,
        hintText: "Példa Béla",
      ),
    );
  }

  Widget professionTextField() {
    return TextFormField(
      controller: _profession,
      validator: (value) {
        if (value.isEmpty) return AppLocalizations.of(context).profession +  AppLocalizations.of(context).noEmpty;

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.apartment_outlined,
          color: Colors.cyan,
        ),
        labelText: AppLocalizations.of(context).profession,
        helperText: AppLocalizations.of(context).profession +  AppLocalizations.of(context).noEmpty,
        hintText: "Full Stack Developer",
      ),
    );
  }

  Widget dobField() {
    return TextFormField(
      controller: _dob,
      validator: (value) {
        if (value.isEmpty) return AppLocalizations.of(context).dob +  AppLocalizations.of(context).noEmpty;

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.access_alarm,
          color: Colors.cyan,
        ),
        labelText: AppLocalizations.of(context).name,
        helperText: "dd/mm/yyyy",
        hintText: "01/01/2020",
      ),
    );
  }

  Widget titleTextField() {
    return TextFormField(
      controller: _title,
      validator: (value) {
        if (value.isEmpty) return AppLocalizations.of(context).title +  AppLocalizations.of(context).noEmpty;

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: AppLocalizations.of(context).title,
        helperText: AppLocalizations.of(context).title ,
        hintText: "Flutter Developer",
      ),
    );
  }

  Widget aboutTextField() {
    return TextFormField(
      controller: _about,
      validator: (value) {
        if (value.isEmpty) return AppLocalizations.of(context).writeSomething;

        return null;
      },
      maxLines: 4,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        labelText: AppLocalizations.of(context).about,
        helperText: AppLocalizations.of(context).writeSomething,
        hintText: AppLocalizations.of(context).writeSomething,
      ),
    );
  }

}
