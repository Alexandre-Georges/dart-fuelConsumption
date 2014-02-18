library converter;

import 'dart:math';

const double METERS_IN_ONE_MILE = 1609.344;

double IDENTITY(value) => value;

Function IDENTITY_POWER(int power) {
  double closure (double value) {
    return value * pow(10, power);
  }
  return closure;
}

Function MILES_TO_METER(double value) => METERS_IN_ONE_MILE * value;
Function METER_TO_MILES(double value) => value / METERS_IN_ONE_MILE;