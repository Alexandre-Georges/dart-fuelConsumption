class Unit {
  String _name;
  Function _toReferenceUnit;
  
  Unit(this._name, this._toReferenceUnit);
  
  double convertToReferenceUnit(double value) {
    return _toReferenceUnit(value);
  }
  
  double referenceToUnit(double value) {
    double referenceValue = _toReferenceUnit(1);
    if (referenceValue != 0) {
      return value / referenceValue;
    }
    return 0.0;
  }
  
  double convertTo(double value, Unit destinationUnit) {
    double valueInReferenceUnit = this.convertToReferenceUnit(value);
    return destinationUnit.referenceToUnit(valueInReferenceUnit);
  }
}