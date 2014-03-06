import 'package:polymer/polymer.dart';

import '../model/model.dart';
import 'main_element.dart';
import '../observers/object_observer.dart';
import '../observers/list_object_observer.dart';

@CustomTag('my-model')
class MyModelElement extends MainElement {

  @published
  Model model = null;

  MyModelElement.created() : super.created();

  void enteredView() {
    super.enteredView();

    ListObjectObserver<Unit, double> observer = new ListObjectObserver<Unit, double>(this.model.units, 'value');
    observer.changes.listen((List<ObjectChangeRecord> changeRecords) {
      print('here ' + changeRecords[0].object.toString() + ' ' + changeRecords[0].object.name + ' ' + changeRecords[0].oldValue.toString() + ' ' + changeRecords[0].newValue.toString());
    });

    ObjectObserver<Unit, double> referenceObserver = new ObjectObserver<Unit, double>(this.model.referenceUnit, 'value');
    referenceObserver.changes.listen((List<ObjectChangeRecord> changeRecords) {
      print('here referenceObserver ' + changeRecords[0].object.toString() + ' ' + changeRecords[0].object.name + ' ' + changeRecords[0].oldValue.toString() + ' ' + changeRecords[0].newValue.toString());
    });
  }
}
