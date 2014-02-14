import 'package:observe/observe.dart';

class Unit extends Object with ChangeNotifier {

  double _value = null;
  String name = null;
  Function unitToReference = null;
  Function referenceToUnit = null;
  
  Unit(this.name, this.unitToReference, this.referenceToUnit);

  @reflectable
  double get value => this._value;

  @reflectable
  void set value(value) {
    this._value = notifyPropertyChange(#value, _value, value);
  }

  double getUnitToReference() {
    return this.unitToReference(this._value);
  }
  
  double setValueFromReference(double referenceValue) {
    this._value = this.referenceToUnit(referenceValue);
  }
}