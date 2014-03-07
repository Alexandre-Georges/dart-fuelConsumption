import 'package:observe/observe.dart';

import 'unit.dart';
import 'reference_unit.dart';

class RegularUnit extends Unit {

  RegularUnit(String name, Function unitToReference, Function referenceToUnit, Unit referenceUnit) : super(name, unitToReference, referenceToUnit) {
    this.setValueFromReference(referenceUnit.value);
  }

}
