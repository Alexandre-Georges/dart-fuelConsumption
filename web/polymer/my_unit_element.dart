import 'package:polymer/polymer.dart';

import '../transformers/transformers.dart';
import '../model/unit.dart';
import 'main_element.dart';

@CustomTag('my-unit')
class MyUnitElement extends MainElement {

  @published
  Unit unit = null;

  String displayValue = null;
  boolean editing = false;
  boolean editing2 = false;

  /**
   * Getter and setter for the UI
   */
  String get value {
    return this.displayValue;
  }

  void set value(String value) {
    print('set ' + value + ' ' + double.parse(value).toString());
    this.editing = true;
    this.editing2 = true;
    this.unit.value = double.parse(value);
    this.displayValue = notifyPropertyChange(#value, displayValue, value);
  }

  MyUnitElement.created() : super.created();

  void enteredView() {
    super.enteredView();

    this.displayValue = notifyPropertyChange(#value, this.displayValue, this.unit.value);
/*
    PathObserver observer = new PathObserver(this.unit, 'value');
    observer.changes.listen((_) {
      print(this.unit.toString() + ' ' + this.editing.toString() + ' ' + this.unit.value.toString());
      if (!this.editing) {
        this.displayValue = notifyPropertyChange(#value, this.displayValue, roundTwoDigit(this.unit.value));
      } else {
        this.editing = false;
      }
    });*/
  }

  void eventTest(Event e, var detail, Node target) {
    //unit.value = unit.value + 1;
  }

}
