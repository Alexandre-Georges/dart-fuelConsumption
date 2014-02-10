library main_test;

import 'package:unittest/unittest.dart';
import '../web/unit.dart';

main() {

  test('constructor', () {

    String name = 'name';
    double unitToReference(double value) => 123;
    double referenceToUnit(double value) => 321;

    Unit unit = new Unit(name, unitToReference, referenceToUnit);

    expect(unit.name, equals(name));
    expect(unit.value, isNull);

    unit.value = 0;
    expect(unit.unitToReference(), equals(123));

    unit.value = null;
    unit.setValueFromReference(0);
    expect(unit.value, equals(321));
  });

  test('conversion with the reference unit', () {

    double unitToReference(double value) => value * 2;
    double referenceToUnit(double value) => value / 2;

    Unit unit = new Unit('name', unitToReference, referenceToUnit);

    List<double> values = [ -10, -1, 0, 1, 10 ];

    void tests(value) {

      unit.value = value;
      expect(unit.unitToReference(), equals(unitToReference(value)));

      unit.value = null;
      unit.setValueFromReference(value);
      expect(unit.value, equals(referenceToUnit(value)));
    };

    values.forEach(tests);
  });

}