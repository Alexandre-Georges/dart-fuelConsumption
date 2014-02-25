import 'package:observe/observe.dart';

import 'reference_unit.dart';
import 'regular_unit.dart';

class Model {

  String name;
  ReferenceUnit referenceUnit;
  List<RegularUnit> units;

  Model(this.name, this.referenceUnit) {
    units = [];
  }

  void addUnit(RegularUnit regularUnit) {
    this.units.add(regularUnit);
  }

}