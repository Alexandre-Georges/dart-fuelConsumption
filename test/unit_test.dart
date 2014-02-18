import 'package:unittest/unittest.dart';
import '../web/model/unit.dart';

main() {

  String name = 'name';
  double constructorUnitToReference(double value) => 123;
  double constructorReferenceToUnit(double value) => 321;

  Unit constructorUnit = new Unit(name, constructorUnitToReference, constructorReferenceToUnit);

  test('constructor : name', () {
    expect(constructorUnit.name, equals(name));
  });

  test('constructor : value', () {
    expect(constructorUnit.value, isNull);
  });

  test('constructor : unit to reference', () {
    constructorUnit.value = 0;
    expect(constructorUnit.getUnitToReference(), equals(123));
  });

  test('constructor : value from reference', () {
    constructorUnit.value = null;
    constructorUnit.setValueFromReference(0);
    expect(constructorUnit.value, equals(321));
  });

  List<double> testValues = [ -10, -1, 0, 1, 10 ];

  double conversionUnitToReference(double value) => value * 2;
  double conversionReferenceToUnit(double value) => value / 2;

  Unit conversionUnit = new Unit('name', conversionUnitToReference, conversionReferenceToUnit);

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