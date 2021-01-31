import 'package:flutter_test/flutter_test.dart';
import 'package:hello_word_android_studio/models/activity_model.dart';
import 'package:hello_word_android_studio/models/destination_model.dart';

void main() {
  group('Destination', ()
  {
    test('Activities test', () {
      var model = Destination();

      model.city = 'Varos';

      expect(model.city, 'Varos');
    });
  });
}