import 'package:observe/observe.dart';

import 'unit.dart';
import 'reference_unit.dart';

class RegularUnit extends Unit {

  ReferenceUnit referenceUnit = null;

  RegularUnit(String name, Function unitToReference, Function referenceToUnit, this.referenceUnit) : super(name, unitToReference, referenceToUnit) {
    this.setValueFromReference(this.referenceUnit.value);
  }

  void set newValue(double value) {
    print('newValue regular ' + value.toString());
    this.value = value;
    this.referenceUnit.value = this.unitToReference(this.value);
  }

}
