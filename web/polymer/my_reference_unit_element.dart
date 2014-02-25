import 'package:polymer/polymer.dart';

import 'my_unit_element.dart';

@CustomTag('my-reference-unit')
class MyReferenceUnitElement extends MyUnitElement {

  void set value(String value) {
    print('set ' + value + ' ' + double.parse(value).toString());
    this.editing = true;
    this.unit.value = double.parse(value);
    this.displayValue = notifyPropertyChange(#value, displayValue, value);
  }

  MyReferenceUnitElement.created() : super.created();

}
