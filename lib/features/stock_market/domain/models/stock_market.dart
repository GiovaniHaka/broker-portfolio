import 'dart:developer';

import 'package:broker_portfolio/features/stock_market/domain/models/types/stock_indicator.dart';
import 'package:broker_portfolio/features/stock_market/domain/models/types/stock_interval.dart';
import 'package:broker_portfolio/features/stock_market/domain/models/types/stock_range.dart';
import 'package:broker_portfolio/utils/datetime/datetime_from_timestamp.dart';
import 'package:broker_portfolio/utils/profitability/calculate_profitability.dart';

class StockMarket {
  String symbol;
  String currency;
  StockRange range;
  StockInterval interval;
  List<StockRange> validRanges;
  List<StockIndicator> indicators;

  StockMarket({
    required this.symbol,
    required this.currency,
    required this.range,
    required this.interval,
    required this.validRanges,
    required this.indicators,
  });

  factory StockMarket.fromMap(Map<String, dynamic> map) {
    final meta = map['meta'];
    final timestamps = map['timestamp'] as List;
    final quotes = map['indicators']['quote'] as List;
    final opens = quotes.first['open'] as List;

    log(quotes.toString());

    final stockMarket = StockMarket(
      symbol: meta['symbol'] ?? '',
      currency: meta['currency'] ?? '',
      range: StockRange.fromString(meta['range']),
      interval: StockInterval.fromString(meta['dataGranularity']),
      indicators: _stockIndicatorFromLists(opens, timestamps),
      validRanges: _validRangesFromList(meta['validRanges']),
    );

    stockMarket._calculateIndicatorsVariation();

    return stockMarket;
  }

  static List<StockIndicator> _stockIndicatorFromLists(
    List quotes,
    List timestamps,
  ) {
    List<StockIndicator> indicators = [];
    final lenght = quotes.length;

    for (int i = 0; i < lenght; i++) {
      indicators.add(
        StockIndicator(
          dateTime: dateTimeFromTimestamp(timestamps[i]),
          quote: quotes[i],
        ),
      );
    }

    indicators.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return indicators;
  }

  static List<StockRange> _validRangesFromList(List ranges) {
    List<StockRange> validRanges = [];
    for (String range in ranges) {
      validRanges.add(StockRange.fromString(range));
    }
    return validRanges;
  }

  void _calculateIndicatorsVariation() {
    final indicatorsLength = indicators.length;

    for (int i = 1; i < indicatorsLength; i++) {
      final previousQuote = indicators[i - 1].quote;
      indicators[i].calculateVariation(previousQuote);
    }
  }

  double get lastVariation {
    final indicator = indicators.last;
    return indicator.quote;
  }

  double get rangeProfitability {
    final first = indicators.first.quote;
    final last = indicators.last.quote;
    return calculateProfitability(first, last);
  }

  @override
  String toString() {
    return 'StockMarket(symbol: $symbol, currency: $currency, range: $range, interval: $interval, validRanges: $validRanges, indicators: $indicators)';
  }
}
