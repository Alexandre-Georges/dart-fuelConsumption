import 'package:polymer/polymer.dart';

import '../model/model.dart';
import '../builder/model_builder.dart';

@CustomTag('my-converter')
class MyConverterElement extends PolymerElement {

  @observable
  List<Model> models = new List();

  MyConverterElement.created() : super.created() {
    models.add(DISTANCE);
  }

}
