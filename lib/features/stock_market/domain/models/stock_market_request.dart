import 'package:broker_portfolio/features/stock_market/domain/models/types/stock_interval.dart';
import 'package:broker_portfolio/features/stock_market/domain/models/types/stock_range.dart';

class StockMarketRequest {
  String symbol;
  StockRange range;
  StockInterval interval;

  StockMarketRequest({
    required this.symbol,
    this.range = StockRange.oneMonth,
    this.interval = StockInterval.oneDay,
  });

  queryParametersToMap() {
    return {
      'interval': interval.value,
      'range': range.value,
    };
  }
}
