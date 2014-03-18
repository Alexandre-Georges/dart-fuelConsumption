library my_polymer_my_model_element;

import 'package:polymer/polymer.dart';

import '../observers/import.dart';

import 'main_element.dart';

import '../model/import.dart';

@CustomTag('my-model')
class MyModelElement extends MainElement {

  @published
  Model model = null;

  List<Unit> unitToIgnore = [];

  MyModelElement.created() : super.created();

  void enteredView() {
    super.enteredView();

    ListObjectObserver<double> observer = new ListObjectObserver<double>(this.model.units, 'value');
    observer.changes.listen(this.updateUnit);

    ObjectObserver<double> referenceObserver = new ObjectObserver<double>(this.model.referenceUnit, 'value');
    referenceObserver.changes.listen(this.updateUnit);
  }

  void updateUnit(List<ObjectChangeRecord> changeRecords) {
    if (this.unitToIgnore.length > 0) {
      changeRecords.forEach((ObjectChangeRecord objectChangeRecord) {
        print('removeUnit ' + (objectChangeRecord.object as Unit).name);
        unitToIgnore.remove(objectChangeRecord.object);
      });
    } else {
      Unit currentUnit = changeRecords.last.object as Unit;
      print('updateUnit ' + currentUnit.name);

      this.unitToIgnore.addAll(this.model.units);
      this.unitToIgnore.remove(currentUnit);

      this.model.updateUnitValues(currentUnit);
    }
  }
}