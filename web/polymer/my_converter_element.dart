library my_polymer_my_converter_element;

import 'package:polymer/polymer.dart';

import 'main_element.dart';

import '../model/import.dart';
import '../builder/import.dart';

@CustomTag('my-converter')
class MyConverterElement extends MainElement {

  @observable
  List<Model> models = new List();

  MyConverterElement.created() : super.created() {
    models.add(DISTANCE);
  }
}
