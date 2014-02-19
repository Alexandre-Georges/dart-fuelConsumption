import 'package:unittest/unittest.dart';
import '../web/transformers/transformers.dart';

main() {

  test('round : type', () {
    expect(roundTwoDigit(123.456789) is String, isTrue);
  });

  var testValues = [];
  addTestValue(double value, String expectedResult) => testValues.add({ 'value': value, 'expectedResult': expectedResult });

  addTestValue(123.456789, '123.46');
  addTestValue(123.45, '123.45');
  addTestValue(123.4, '123.40');
  addTestValue(123.0, '123.00');
  addTestValue(0.0, '0.00');
  addTestValue(0.12345, '0.12');
  addTestValue(-123.456789, '-123.46');

  testValues.forEach((testValue) {
    var value = testValue['value'];
    test('round : ' + value.toString(), () {
      expect(roundTwoDigit(value), equals(testValue['expectedResult']));
    });
  });

}