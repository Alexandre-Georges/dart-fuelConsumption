import 'package:polymer/polymer.dart';

import 'main_element.dart';

import '../model/model.dart';
import '../builder/model_builder.dart';

@CustomTag('my-converter')
class MyConverterElement extends MainElement {

  @observable
  List<Model> models = new List();

  MyConverterElement.created() : super.created() {
    models.add(DISTANCE);
  }
}
