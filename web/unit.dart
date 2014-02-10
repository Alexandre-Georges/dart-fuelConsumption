class Unit {

  String _name = null;
  double _value = null;
  Function _unitToReference = null;
  Function _referenceToUnit = null;
  
  Unit(this._name, this._unitToReference, this._referenceToUnit);

  String get name => this._name;
  double get value => this._value;
  void set value(value) => this._value = value;

  double unitToReference() {
    return this._unitToReference(this._value);
  }
  
  double setValueFromReference(double referenceValue) {
    this._value = this._referenceToUnit(referenceValue);
  }
  /*
  double convertTo(double value, Unit destinationUnit) {
    double valueInReferenceUnit = this.unitToReference(value);
    return destinationUnit.referenceToUnit(valueInReferenceUnit);
  }*/
}