import 'package:polymer/polymer.dart';
import '../unit.dart';

@CustomTag('my-unit')
class MyUnitElement extends PolymerElement {

  @published
  Unit unit = null;

  MyUnitElement.created() : super.created();

  @override
  void enteredView() {
    unit.value = 1;
    //unit.changes.listen((List<ChangeRecord> record) => print('change'));
  }

  void eventTest(Event e, var detail, Node target) {
    unit.value = unit.value + 1;
    print("hello");
  }

}
