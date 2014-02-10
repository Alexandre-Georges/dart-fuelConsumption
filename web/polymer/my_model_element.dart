import 'package:polymer/polymer.dart';
import '../converter.dart';

@CustomTag('my-model')
class MyModelElement extends PolymerElement {

  @published
  Model model = null;

  MyModelElement.created() : super.created();

  void updateChildren(Event e, var detail, Node target/*double referenceValue*/) {
    print(model);
  }
}
