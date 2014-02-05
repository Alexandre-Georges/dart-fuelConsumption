library main_test;

import 'package:unittest/unittest.dart';
import '../web/unit.dart';
import '../web/model.dart';

main() {

  test('constructor', () {

    String name = 'name';
    Unit referenceUnit = new Unit(null, null, null);

    Model model = new Model(name, referenceUnit);

    expect(model.name, equals(name));
    expect(model.referenceUnit, equals(referenceUnit));
    expect(model.units, isNotNull);
    expect(model.units.length, equals(0));
  });

  test('addUnit', () {

    String name = 'name';
    Unit referenceUnit = new Unit(null, null, null);

    Model model = new Model(name, referenceUnit);

    expect(model.units.length, equals(0));

    Unit unitToAdd = new Unit(null, null, null);
    model.addUnit(unitToAdd);
    
    expect(model.units.length, equals(1));
    expect(model.units[0], equals(unitToAdd));
  });

}