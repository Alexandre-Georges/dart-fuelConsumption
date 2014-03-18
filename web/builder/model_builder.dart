library my_builder_model_builder;

import '../converter/import.dart';
import '../model/import.dart';

ReferenceUnit METER = new ReferenceUnit('meter');
RegularUnit KILOMETER = new RegularUnit('kilometer', IDENTITY_POWER(3), IDENTITY_POWER(-3), METER);
RegularUnit MILE = new RegularUnit('mile', MILES_TO_METER, METER_TO_MILES, METER);


Model DISTANCE = new Model('Distance', METER)
  ..addUnit(KILOMETER)
  ..addUnit(MILE);