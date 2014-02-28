import 'dart:async';
import 'dart:collection' show UnmodifiableListView;
import 'package:observe/observe.dart';
import '../model/unit.dart';

class UnitObserver {

  Unit _unit;
  double _currentValue;
  Symbol valueSymbol = new Symbol('value');

  StreamController _changes;
  List<UnitChangeRecord> _records;

  UnitObserver(this._unit) {
    this._currentValue = this._unit.value;
  }

  void observed() {
    _updateValue();
    _observePath();
  }

  void _updateValue() {
    this._currentValue = this._unit.value;
  }

  void _updateObservedValue() {
    if (this.hasObservers && this._currentValue != this._unit.value) {
      this.notifyChange(new UnitChangeRecord(this._unit, this._currentValue, this._unit.value));
    }
    this._updateValue();
  }

  void _observePath() {
    this._unit.changes.listen((List<PropertyChangeRecord> records) {
      for (var record in records) {
        if ((record as PropertyChangeRecord).name == valueSymbol) {
          _updateObservedValue();
          return;
        }
      }
    });
  }

  void unobserved() {
    _changes = null;
  }

  Stream<List<UnitChangeRecord>> get changes {
    if (_changes == null) {
      _changes = new StreamController.broadcast(sync: true, onListen: observed, onCancel: unobserved);
    }
    return _changes.stream;
  }

  bool deliverChanges() {
    var records = _records;
    _records = null;
    if (hasObservers && records != null) {
      _changes.add(new UnmodifiableListView<UnitChangeRecord>(records));
      return true;
    }
    return false;
  }

  bool get hasObservers => _changes != null && _changes.hasListener;

  void notifyChange(UnitChangeRecord record) {
    if (!hasObservers) return;

    if (_records == null) {
      _records = [];
      scheduleMicrotask(deliverChanges);
    }
    _records.add(record);
  }

}

class UnitChangeRecord {

  final unit;
  final T oldValue;
  final T newValue;

  UnitChangeRecord(this.unit, this.oldValue, this.newValue);

  String toString() => '#<UnitChangeRecord $unit from: $oldValue to: $newValue>';
}