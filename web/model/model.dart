import 'package:observe/observe.dart';

import 'reference_unit.dart';
import 'regular_unit.dart';

class Model {

  String name;
  ReferenceUnit referenceUnit;
  List<RegularUnit> units;

  Model(this.name, this.referenceUnit) {
    units = [];
    PathObserver observer = new PathObserver(referenceUnit, 'value');
    observer.changes.listen((_) {
      print('ref updated');
      this.updateUnits(this.referenceUnit.value);
    });
  }

  void addUnit(RegularUnit regularUnit) {
    this.units.add(regularUnit);
  }

  void updateUnits(referenceValue) {
    units.forEach((unit) => unit.setValueFromReference(referenceValue));
  }

}