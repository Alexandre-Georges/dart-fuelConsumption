import 'package:polymer/polymer.dart';

import 'my_unit_element.dart';
import '../model/reference_unit.dart';
import '../observers/object_observer.dart';

@CustomTag('my-regular-unit')
class MyRegularUnitElement extends MyUnitElement {

  @published
  ReferenceUnit reference = null;

  MyRegularUnitElement.created() : super.created();

  void enteredView() {
    super.enteredView();

/*    ObjectObserver<Unit, double> observer = new ObjectObserver<Unit, double>(this.unit, 'value');
    observer.changes.listen((List<ObjectChangeRecord> changeRecords) {
      print('here ' + changeRecords[0].object.toString() + ' ' + changeRecords[0].oldValue.toString() + ' ' + changeRecords[0].newValue.toString());
    });*/

   /* PathObserver valueObserver = new PathObserver(this.unit, 'value');
    valueObserver.changes.listen((_) {
      this.reference.value = this.unit.unitToReference(this.unit.value);
    });
    PathObserver referenceValueObserver = new PathObserver(this.reference, 'value');
    referenceValueObserver.changes.listen((_) {
      print('MyRegularUnitElement reference value ' + this.reference.value.toString());
      if (!this.editing2) {
        this.unit.setValueFromReference(this.reference.value);
      } else {
        this.editing2 = false;
      }
    });*/
  }

}
