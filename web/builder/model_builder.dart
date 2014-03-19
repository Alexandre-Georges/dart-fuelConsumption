library my_builder_model_builder;

import '../converter/import.dart';
import '../model/import.dart';

ReferenceUnit METER = new ReferenceUnit('meter');
RegularUnit KILOMETER = new RegularUnit('kilometer', IDENTITY_POWER(3), IDENTITY_POWER(-3), METER);
RegularUnit MILE = new RegularUnit('mile', MILES_TO_METERS, METERS_TO_MILES, METER);
RegularUnit YARD = new RegularUnit('yard', YARDS_TO_METERS, METERS_TO_YARDS, METER);

Model DISTANCE = new Model('Distance', METER)
  ..addUnit(KILOMETER)
  ..addUnit(MILE)
  ..addUnit(YARD);


ReferenceUnit CELSIUS = new ReferenceUnit('celsius');
RegularUnit FAHRENHEIT = new RegularUnit('fahrenheit', FAHRENHEITS_TO_CELSIUS, CELSIUS_TO_FAHRENHEITS, CELSIUS);

Model TEMPERATURE = new Model('Temperature', CELSIUS)
  ..addUnit(FAHRENHEIT);