import 'reference_unit.dart';
import 'regular_unit.dart';
import 'package:observe/observe.dart';

class Model {

  String name;
  ReferenceUnit referenceUnit;
  List<RegularUnit> units;

  Model(this.name, this.referenceUnit) {
    units = toObservable([]);
    PathObserver observer = new PathObserver(referenceUnit, 'value');
    observer.changes.listen((_) {
      print('change model');
      this.updateUnits(this.referenceUnit.value);
    });
  }

  void addUnit(String name, Function unitToReference, Function referenceToUnit) {
    this.units.add(new RegularUnit(name, unitToReference, referenceToUnit, this.referenceUnit));
  }

  void updateUnits(referenceValue) {
    units.forEach((unit) => unit.setValueFromReference(referenceValue));
  }

}