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
    expect(unit.unitToReference(0), equals(123));
    expect(unit.referenceToUnit(0), equals(321));
  });

  test('conversion with the reference unit', () {

    double unitToReference(double value) => value * 2;
    double referenceToUnit(double value) => value / 2;

    Unit unit = new Unit('name', unitToReference, referenceToUnit);

    List<double> values = [ -10, -1, 0, 1, 10 ];

    void tests(value) {
      expect(unit.unitToReference(value), equals(unitToReference(value)));
      expect(unit.referenceToUnit(value), equals(referenceToUnit(value)));
    };

    values.forEach(tests);
  });

  test('conversion with another unit', () {

    double unitToReference1(double value) => value * 2;
    double referenceToUnit1(double value) => value / 2;

    Unit unit1 = new Unit('name1', unitToReference1, referenceToUnit1);

    double unitToReference2(double value) => value * 4;
    double referenceToUnit2(double value) => value / 4;

    Unit unit2 = new Unit('name2', unitToReference2, referenceToUnit2);

    List<double> values = [ -10, -1, 0, 1, 10 ];

    void tests(value) {
      expect(unit1.convertTo(value, unit2), equals(referenceToUnit2(unitToReference1(value))));
      expect(unit2.convertTo(value, unit1), equals(referenceToUnit1(unitToReference2(value))));
    };

    values.forEach(tests);
  });

}