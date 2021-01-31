import 'package:flutter/material.dart';
import 'package:hello_word_android_studio/l10n/app_localization.dart';
import 'package:hello_word_android_studio/models/address.dart';

class AddressFormDialog extends StatefulWidget {
  @override
  _AddressFormDialogState createState() => _AddressFormDialogState();
}

class _AddressFormDialogState extends State<AddressFormDialog> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _houseNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Creates a dialog
    return SimpleDialog(
      title: Container(
        child: Text(AppLocalizations.of(context).newAddress),
        alignment: Alignment.center,
      ),
      contentPadding: EdgeInsets.all(10),
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).city,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return AppLocalizations.of(context).noEmpty;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _streetController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).street,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return AppLocalizations.of(context).noEmpty;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _houseNumberController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).houseNumber,
                ),
                cursorColor: Colors.red,
                validator: (value) {
                  if (value.isEmpty) {
                    return AppLocalizations.of(context).noEmpty;
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    textColor: Colors.red[200],
                    child: Text(AppLocalizations.of(context).cancel),
                  ),
                  FlatButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.of(context).pop(
                          Address(
                              city: _cityController.value.text,
                              street: _streetController.value.text,
                              houseNumber: _houseNumberController.value.text),
                        );
                      }
                    },
                    textColor: Colors.red,
                    child: Text(AppLocalizations.of(context).save),
                  ),

                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
