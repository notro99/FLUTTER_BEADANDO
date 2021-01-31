import 'package:flutter/material.dart';
import 'package:hello_word_android_studio/l10n/app_localization.dart';

class Unknown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Text(AppLocalizations.of(context).unknown),
          ],
        ),
      ),
    );
  }
}
