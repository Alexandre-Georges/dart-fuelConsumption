library main_test;

import 'package:unittest/unittest.dart';
import '../web/converter.dart';

main() {
  
  List<double> TEST_VALUES = [ -10.0, -1.0, 0.0, 1.0, 10.0 ];
  
  Function testsForValue (value) {

    test('identity', () {
      expect(IDENTITY(value), equals(value));
    });
    
    test('miles', () {
      expect(METERS_TO_MILES(MILES_TO_METERS(value)), equals(value));
    });
  }
  
  TEST_VALUES.forEach(testsForValue);
  
  test('identity power 0', () {
    Function identityPower = IDENTITY_POWER(0);
    expect(identityPower(-10.0), equals(-10.0));
    expect(identityPower(-1.0), equals(-1.0));
    expect(identityPower(0.0), equals(0.0));
    expect(identityPower(1.0), equals(1.0));
    expect(identityPower(10.0), equals(10.0));
  });
  
  test('identity power 3', () {
    Function identityPower = IDENTITY_POWER(3);
    expect(identityPower(-10.0), equals(-10000.0));
    expect(identityPower(-1.0), equals(-1000.0));
    expect(identityPower(0.0), equals(0.0));
    expect(identityPower(1.0), equals(1000.0));
    expect(identityPower(10.0), equals(10000.0));
  });
  
  test('identity power -3', () {
    Function identityPower = IDENTITY_POWER(-3);
    expect(identityPower(-10.0), equals(-.01));
    expect(identityPower(-1.0), equals(-.001));
    expect(identityPower(0.0), equals(0.0));
    expect(identityPower(1.0), equals(.001));
    expect(identityPower(10.0), equals(.01));
  });

}