class Unit {

  String _name;
  Function _unitToReference;
  Function _referenceToUnit;
  
  Unit(this._name, this._unitToReference, this._referenceToUnit);

  String get name => this._name;

  double unitToReference(double value) {
    return this._unitToReference(value);
  }
  
  double referenceToUnit(double value) {
    return this._referenceToUnit(value);
  }
  
  double convertTo(double value, Unit destinationUnit) {
    double valueInReferenceUnit = this.unitToReference(value);
    return destinationUnit.referenceToUnit(valueInReferenceUnit);
  }
}