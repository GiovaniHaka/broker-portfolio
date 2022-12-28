import 'package:broker_portfolio/utils/profitability/calculate_profitability.dart';

class StockIndicator {
  late double quote;
  double profitability;
  DateTime dateTime;

  StockIndicator({
    required this.dateTime,
    this.profitability = 0,
    double? quote,
  }) {
    this.quote = quote ?? 0;
  }

  void calculateVariation(double previousQuote) {
    profitability = calculateProfitability(previousQuote, quote);
  }

  @override
  String toString() =>
      'StockIndicator(dateTime: $dateTime, quote: $quote, variation: $profitability)';
}
