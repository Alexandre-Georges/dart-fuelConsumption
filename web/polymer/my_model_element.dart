import 'package:polymer/polymer.dart';

import '../model/model.dart';

@CustomTag('my-model')
class MyModelElement extends PolymerElement {

  @published
  Model model = null;

  MyModelElement.created() : super.created();

}
