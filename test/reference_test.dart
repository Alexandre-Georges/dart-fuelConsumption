library my_test_reference;

import 'package:unittest/unittest.dart';
import '../web/model/import.dart';

main() {

  String name = 'name';

  ReferenceUnit referenceUnit = new ReferenceUnit(name);

  test('constructor : name', () {
    expect(referenceUnit.name, equals(name));
  });

  test('constructor : value', () {
    expect(referenceUnit.value, equals(0.0));
  });

  List<double> testValues = [ -10.0, -1.0, 0.0, 1.0, 10.0 ];
  testValues.forEach((double testValue) {

    test('constructor : unit to reference', () {
      referenceUnit.value = testValue;
      expect(referenceUnit.getUnitToReference(), equals(testValue));
    });

    test('constructor : value from reference', () {
      referenceUnit.value = null;
      referenceUnit.setValueFromReference(testValue);
      expect(referenceUnit.value, equals(testValue));
    });
  });

}