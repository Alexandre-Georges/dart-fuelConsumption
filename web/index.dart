import 'dart:html';
import 'converter.dart';

void  main() {
  InputElement inputField = querySelector('#input-mpg');
  inputField.onInput.listen(mpgEvent);
}

void mpgEvent(Event e) {
  print(Converter.MPG_TO_L100KM(1.0));
}