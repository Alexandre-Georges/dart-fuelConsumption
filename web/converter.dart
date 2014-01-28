library converter;

  const double LITRES_IN_ONE_GALLON = 1.0;
  const double METERS_IN_ONE_MILE = 1600.0;
  
  double NO_CONVERSION(value) => value;

  double MILES_TO_METERS(value) => METERS_IN_ONE_MILE * value;
  double KILOMETERS_TO_METERS(value) => 1000.0 * value;
  
  double MPG_TO_L100KM(mpg) {
    return METERS_IN_ONE_MILE;
  }
  
  double L100KM_TO_MPG(l100Km) {
    return LITRES_IN_ONE_GALLON;
  }