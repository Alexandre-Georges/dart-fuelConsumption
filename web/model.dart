import 'package:observe/observe.dart';

class Model {

  String name;
  Unit referenceUnit;
  List<Unit> units;

  Model(this.name, this.referenceUnit) {
    units = toObservable([]);
    ListPathObserver observer = new ListPathObserver(units, 'referenceValue');
    observer.changes.listen((_) => print('change model'));
  }

  void addUnit(Unit unit) => this.units.add(unit);

  void updateUnits(referenceValue) {
    this.referenceUnit.setValue(referenceValue);
    units.forEach((unit) => unit.setValueFromReference(referenceValue));
  }

}