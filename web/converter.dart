library converter;

import 'dart:math';

  const double METERS_IN_ONE_MILE = 1600.0;
  
  double IDENTITY(value) => value;

  double MILES_TO_METERS(value) => METERS_IN_ONE_MILE * value;
  double METERS_TO_MILES(value) => value / METERS_IN_ONE_MILE;
  
  double KILOMETERS_TO_METERS(value) => 1000.0 * value;

  Function IDENTITY_POWER(int power) {
    double closure (double value) {
      return value * pow(10, power);
    }
    return closure;
  }