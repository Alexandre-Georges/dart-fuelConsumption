library my_converter_converter;

import 'dart:math';

const double METERS_IN_ONE_MILE = 1609.344;
const double METERS_IN_ONE_YARD = 1.09361;

double IDENTITY(value) => value;

Function IDENTITY_POWER(int power) {
  double closure (double value) {
    return value * pow(10, power);
  }
  return closure;
}

double MILES_TO_METERS(double value) => METERS_IN_ONE_MILE * value;
double METERS_TO_MILES(double value) => value / METERS_IN_ONE_MILE;

double YARDS_TO_METERS(double value) => METERS_IN_ONE_YARD * value;
double METERS_TO_YARDS(double value) => value / METERS_IN_ONE_YARD;