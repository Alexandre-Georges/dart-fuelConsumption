import 'package:observe/observe.dart';

class Unit extends Object with ChangeNotifier, Observable {

  @observable
  double value = null;

  String name = null;
  Function unitToReference = null;
  Function referenceToUnit = null;
  
  Unit(this.name, this.unitToReference, this.referenceToUnit);

  double getUnitToReference() {
    return this.unitToReference(this.value);
  }
  
  double setValueFromReference(double referenceValue) {
    this.value = this.referenceToUnit(referenceValue);
  }
}