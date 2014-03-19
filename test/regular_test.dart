library my_test_regular;

import 'package:unittest/unittest.dart';

import '../web/model/import.dart';

main() {

  ReferenceUnit referenceUnit = new ReferenceUnit(null);

  String name = 'name';
  double constructorUnitToReference(double value) => 123.0;
  double constructorReferenceToUnit(double value) => 321.0;

  RegularUnit constructorUnit = new RegularUnit(name, constructorUnitToReference, constructorReferenceToUnit, referenceUnit);

  test('constructor : name', () {
    expect(constructorUnit.name, equals(name));
  });

  test('constructor : value', () {
    expect(constructorUnit.value, equals(constructorReferenceToUnit(referenceUnit.value)));
  });

  test('constructor : unit to reference', () {
    constructorUnit.value = 0.0;
    expect(constructorUnit.getUnitToReference(), equals(123.0));
  });

  test('constructor : value from reference', () {
    constructorUnit.value = null;
    constructorUnit.setValueFromReference(0.0);
    expect(constructorUnit.value, equals(321.0));
  });

  List<double> testValues = [ -10.0, -1.0, 0.0, 1.0, 10.0 ];

  double conversionUnitToReference(double value) => value * 2.0;
  double conversionReferenceToUnit(double value) => value / 2.0;

  RegularUnit conversionUnit = new RegularUnit('name', conversionUnitToReference, conversionReferenceToUnit, referenceUnit);

  testValues.forEach((double testValue) {
    test('unit to reference : ' + testValue.toString(), () {
      conversionUnit.value = testValue;
      expect(conversionUnit.getUnitToReference(), equals(conversionUnitToReference(testValue)));
    });
    test('reference to unit : ' + testValue.toString(), () {
      conversionUnit.value = null;
      conversionUnit.setValueFromReference(testValue);
      expect(conversionUnit.value, equals(conversionReferenceToUnit(testValue)));
    });
  });

}