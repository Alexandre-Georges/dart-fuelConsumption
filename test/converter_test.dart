library my_test_converter;

import 'package:unittest/unittest.dart';

import '../web/converter/import.dart';

main() {

  List<double> testValues = [ -10.0, -1.0, 0.0, 1.0, 10.0 ];

  testValues.forEach((double testValue) {

    test('identity : ' + testValue.toString(), () {
      expect(IDENTITY(testValue), equals(testValue));
    });

    test('identity power 0 : ' + testValue.toString(), () {
      Function identityPower = IDENTITY_POWER(0);
      expect(identityPower(testValue), equals(testValue));
    });

    test('identity power 3', () {
      Function identityPower = IDENTITY_POWER(3);
      expect(identityPower(testValue), equals(testValue * 1000.0));
    });

    test('identity power -3', () {
      Function identityPower = IDENTITY_POWER(-3);
      expect(identityPower(testValue), equals(testValue / 1000.0));
    });

    test('miles to meters : ' + testValue.toString(), () {
      expect(MILES_TO_METERS(METERS_TO_MILES(testValue)).roundToDouble(), equals(testValue));
    });

    test('yards to meters : ' + testValue.toString(), () {
      expect(YARDS_TO_METERS(METERS_TO_YARDS(testValue)).roundToDouble(), equals(testValue));
    });

  });

}