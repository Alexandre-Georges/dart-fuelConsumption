library my_model_reference_unit;

import 'unit.dart';
import '../converter/converter.dart';

class ReferenceUnit extends Unit {

  ReferenceUnit(String name) : super(name, IDENTITY, IDENTITY) {
    this.value = 0.0;
  }

  String toString() {
    return 'ReferenceUnit with name: ' + this.name;
  }
}