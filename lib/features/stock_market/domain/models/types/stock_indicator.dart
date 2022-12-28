import 'package:broker_portfolio/utils/profitability/calculate_profitability.dart';

class StockIndicator {
  late double quote;
  DateTime dateTime;
  double? profitability;

  StockIndicator({
    required this.dateTime,
    double? quote,
    this.profitability,
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
