library my_polymer_my_polymer_expressions;

import 'package:polymer/polymer.dart';
import 'package:polymer_expressions/polymer_expressions.dart';

import '../transformers/transformers.dart';

class MyPolymerExpressions extends PolymerExpressions {

  static MyPolymerExpressions INSTANCE = new MyPolymerExpressions();

  static Map<String, Function> GLOBALS = {
      'roundTwoDigit': roundTwoDigit
  };

  MyPolymerExpressions(): super(globals: GLOBALS) {
    INSTANCE = this;
  }

  prepareBinding(String path, name, node) => Polymer.prepareBinding(path, name, node, super.prepareBinding);
}