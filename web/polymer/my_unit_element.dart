import 'package:polymer/polymer.dart';

import '../model/unit.dart';
import 'main_element.dart';

@CustomTag('my-unit')
class MyUnitElement extends MainElement {

  @published
  Unit unit = null;

  MyUnitElement.created() : super.created();

  void eventTest(Event e, var detail, Node target) {
    unit.value = unit.value + 1;
    print("hello " + unit.value.toString());
  }

}