library converter;

class Converter {
  static const double LITRES_IN_ONE_GALLON = 1.0;
  static const double KILOMETERS_IN_ONE_MILE = 1.0;
  
  static double MPG_TO_L100KM(mpg) {
    return KILOMETERS_IN_ONE_MILE;
  }
  
  static double L100KM_TO_MPG(l100Km) {
    return LITRES_IN_ONE_GALLON;
  }
}