import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_word_android_studio/l10n/app_localization.dart';
import 'package:hello_word_android_studio/models/hotel_model.dart';
import 'package:hello_word_android_studio/widgets/hotel_carousel.dart';
import 'package:provider/provider.dart';

void main() {
  Hotel hotel =  Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'Hotel Cairo',
    address: 'Siófok',
    price: 12000,
  );
  group('HomeScreen', () {
    testWidgets('Show names', (WidgetTester tester) async {
      await tester.pumpWidget(
        Localizations(
          locale: Locale('en', 'EN'),
          delegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          child: HotelCarousel(

          ),
        ),
      );

      await tester.pumpAndSettle();
      final hotelNameFinder = find.text(hotel.name);

      expect(hotelNameFinder, findsOneWidget);
    });
  });
}
