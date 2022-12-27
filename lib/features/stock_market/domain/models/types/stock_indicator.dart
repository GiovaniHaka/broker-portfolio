class StockIndicator {
  DateTime dateTime;
  double quote;
  double? variation;

  StockIndicator({
    required this.dateTime,
    required this.quote,
    this.variation,
  });

  calculateVariation(double previousQuote) {
    variation = (quote / previousQuote) * 100 - 100;
  }

  @override
  String toString() =>
      'StockIndicator(dateTime: $dateTime, quote: $quote, variation: $variation)';
}
