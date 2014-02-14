import 'package:observe/observe.dart';

class Unit extends Object with ChangeNotifier {

  double _referenceValue = null;
  double _value = null;

  String name = null;
  Function unitToReference = null;
  Function referenceToUnit = null;
  
  Unit(this.name, this.unitToReference, this.referenceToUnit);

  @reflectable
  double get referenceValue => this._referenceValue;

  @reflectable
  void set referenceValue(value) {
    print('1');
    this._referenceValue = notifyPropertyChange(#referenceValue, _referenceValue, value);
  }

  double get value => this._value;

  void set value(value) {
    this._value = value;
    this.referenceValue = this.unitToReference(value);
  }

  double getUnitToReference() {
    return this.unitToReference(this._value);
  }
  
  double setValueFromReference(double referenceValue) {
    this._value = this.referenceToUnit(referenceValue);
  }
}