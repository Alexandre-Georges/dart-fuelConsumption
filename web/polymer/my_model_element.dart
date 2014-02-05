import 'package:polymer/polymer.dart';
import '../converter.dart';

@CustomTag('my-model')
class MyModelElement extends PolymerElement {
  Model model = DISTANCE;

  MyModelElement.created() : super.created();
}
