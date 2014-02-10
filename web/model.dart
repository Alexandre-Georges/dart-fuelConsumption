class Model {

  String _name;
  Unit _referenceUnit;
  List<Unit> _units;

  Model(this._name, this._referenceUnit) {
    _units = [];
  }

  String get name => this._name;
  Unit get referenceUnit => this._referenceUnit;
  List<Unit> get units => this._units;

  void addUnit(Unit unit) => this._units.add(unit);

  void updateUnits(referenceValue) {
    this._referenceUnit.setValue(referenceValue);
    units.forEach((unit) => unit.setValueFromReference(referenceValue));
  }

}