library converter;

import 'dart:math';
import 'unit.dart';
import 'reference_unit.dart';
import 'model.dart';

const double METERS_IN_ONE_MILE = 1609.344;

double IDENTITY(value) => value;

Function IDENTITY_POWER(int power) {
  double closure (double value) {
    return value * pow(10, power);
  }
  return closure;
}

ReferenceUnit METER = new ReferenceUnit('meter');

Model DISTANCE = new Model('Distance', METER)
..addUnit('kilometer', IDENTITY_POWER(3), IDENTITY_POWER(-3))
..addUnit('mile', (value) => METERS_IN_ONE_MILE * value, (value) => value / METERS_IN_ONE_MILE);
