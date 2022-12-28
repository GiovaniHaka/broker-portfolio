double calculateProfitability(double previous, double actual) {
  final value = (actual / previous) * 100 - 100;
  return value.isNaN ? 0 : value;
}
