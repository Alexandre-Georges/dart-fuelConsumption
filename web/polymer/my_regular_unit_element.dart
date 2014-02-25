import 'package:polymer/polymer.dart';

import 'my_unit_element.dart';

@CustomTag('my-regular-unit')
class MyRegularUnitElement extends MyUnitElement {

  void set value(String value) {
    print('set ' + value + ' ' + double.parse(value).toString());
    this.editing = true;
    this.unit.newValue = double.parse(value);
    this.displayValue = notifyPropertyChange(#value, displayValue, value);
  }

  MyRegularUnitElement.created() : super.created();

}
