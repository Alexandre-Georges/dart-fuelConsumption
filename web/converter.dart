library converter;

import 'dart:math';
import 'unit.dart';

const double METERS_IN_ONE_MILE = 1609.344;

double IDENTITY(value) => value;

Function IDENTITY_POWER(int power) {
  double closure (double value) {
    return value * pow(10, power);
  }
  return closure;
}

Unit METER = new Unit('meter', IDENTITY, IDENTITY);
Unit KILOMETER = new Unit('kilometer', IDENTITY_POWER(3), IDENTITY_POWER(-3));
Unit MILE = new Unit('mile', (value) => METERS_IN_ONE_MILE * value, (value) => value / METERS_IN_ONE_MILE);

Model DISTANCE = new Model('Distance', METER)
..addUnit(KILOMETER)
..addUnit(MILE);
