import 'package:polymer/polymer.dart';
import '../model.dart';
import '../converter.dart';

@CustomTag('my-converter')
class MyConverterElement extends PolymerElement {

  List<Model> models = new List();

  MyConverterElement.created() : super.created() {
    models.add(DISTANCE);
  }

}
