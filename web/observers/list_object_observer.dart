import 'dart:async';
import 'dart:collection' show UnmodifiableListView;
import 'dart:mirrors';
import 'package:observe/observe.dart';
import 'object_observer.dart';
import 'object_change_record.dart';

class ListObjectObserver<O, V> {

  List<O> _objects;
  List<ObjectObserver<O, V>> _observers;
  String _propertyName;

  StreamController _changes;
  List<ObjectChangeRecord> _records;

  ListObjectObserver(this._objects, this._propertyName);

  /**
   * Called by observers
   */
  void observed() {
    if (_observers == null) {
      this._observers = [];

      this._objects.forEach((O object) {
        ObjectObserver<O, V> observer = new ObjectObserver<O, V>(object, this._propertyName);
        observer.changes.listen((List<ObjectChangeRecord> changeRecords) {
          if (this.hasObservers) {
            this.notifyChange(changeRecords);
          }
        });
        this._observers.add(observer);
      });
    }
  }

  void unobserved() {
    _changes = null;
  }

  Stream<List<ObjectChangeRecord>> get changes {
    if (_changes == null) {
      _changes = new StreamController.broadcast(sync: true, onListen: observed, onCancel: unobserved);
    }
    return _changes.stream;
  }

  bool deliverChanges() {
    var records = _records;
    _records = null;
    if (hasObservers && records != null) {
      _changes.add(new UnmodifiableListView<ObjectChangeRecord>(records));
      return true;
    }
    return false;
  }

  bool get hasObservers => _changes != null && _changes.hasListener;

  void notifyChange(List<ObjectChangeRecord> records) {
    if (!hasObservers) return;

    if (this._records == null) {
      this._records = [];
      scheduleMicrotask(deliverChanges);
    }
    this._records.addAll(records);
  }

}
