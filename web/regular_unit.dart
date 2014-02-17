import 'unit.dart';
import 'reference_unit.dart';
import 'package:observe/observe.dart';

class RegularUnit extends Unit {

  ReferenceUnit referenceUnit = null;

  RegularUnit(String name, Function unitToReference, Function referenceToUnit, this.referenceUnit) : super(name, unitToReference, referenceToUnit) {
    PathObserver observer = new PathObserver(this, 'value');
    observer.changes.listen((List<ChangeRecord> changeRecords) {
      print('change regular ' + changeRecords.last.newValue.toString());
      this.referenceUnit.value = this.unitToReference(changeRecords.last.newValue);
    });
  }

}
