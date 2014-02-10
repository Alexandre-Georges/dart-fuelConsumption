import 'package:polymer/polymer.dart';
import '../unit.dart';

@CustomTag('my-unit')
class MyUnitElement extends PolymerElement {

  @published
  MyModelElement myModelElement = null;

  @published
  Unit reference = null;

  @published
  Unit unit = null;

  double value = null;

  MyUnitElement.created() : super.created();

  void eventTest(Event e, var detail, Node target) {
    myModelElement.updateChildren();
    print("hello");
  }

}
