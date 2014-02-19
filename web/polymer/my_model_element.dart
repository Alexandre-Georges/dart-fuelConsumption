import 'package:polymer/polymer.dart';

import '../model/model.dart';
import 'main_element.dart';

@CustomTag('my-model')
class MyModelElement extends MainElement {

  @published
  Model model = null;

  MyModelElement.created() : super.created();

}
