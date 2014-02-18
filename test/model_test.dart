library main_test;

import 'package:unittest/unittest.dart';
import '../web/model/unit.dart';
import '../web/model/model.dart';

main() {

  String name = 'name';
  Unit referenceUnit = new Unit(null, null, null);
  Model model = new Model(name, referenceUnit);

  test('constructor : name', () {
    expect(model.name, equals(name));
  });

  test('constructor : reference unit', () {
    expect(model.referenceUnit, equals(referenceUnit));
  });

  test('constructor : units', () {
    expect(model.units, isNotNull);
    expect(model.units.length, equals(0));
  });

  test('addUnit', () {
    Unit unitToAdd = new Unit(null, null, null);
    model.addUnit(unitToAdd);

    expect(model.units.length, equals(1));
    expect(model.units[0], equals(unitToAdd));
  });

}