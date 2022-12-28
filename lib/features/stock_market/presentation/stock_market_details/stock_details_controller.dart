import 'package:broker_portfolio/common/constants/states/states.dart';
import 'package:broker_portfolio/common/types/failure.dart';
import 'package:broker_portfolio/features/stock_market/domain/models/stock_market.dart';
import 'package:broker_portfolio/features/stock_market/domain/models/stock_market_request.dart';
import 'package:broker_portfolio/features/stock_market/domain/models/types/stock_range.dart';
import 'package:broker_portfolio/features/stock_market/domain/usecases/get_stock_market.dart';
import 'package:dartz/dartz.dart';
import 'package:get/state_manager.dart';

class StockMarketDetailsController {
  late GetStockMarket _getStock;

  StockMarketDetailsController([GetStockMarket? getStock]) {
    _getStock = getStock ?? GetStockMarketImp();
  }

  final state = Rx<States>(States.loading);
  final stockMarket = Rx<Either<Failure, StockMarket>>(Left(Failure('')));
  final stockMarketRequest = Rx<StockMarketRequest?>(null);

  initialize(String stockName) async {
    stockMarketRequest.value = StockMarketRequest(symbol: stockName);
    await _getStockMarket();
  }

  onChangeRange(StockRange range) {
    stockMarketRequest.value?.range = range;
    _getStockMarket();
  }

  _getStockMarket() async {
    _setState(States.loading);
    final result = await _getStock.call(stockMarketRequest.value!);
    stockMarket.value = result;
    _setState(States.loaded);
  }

  _setState(States newState) {
    state.value = newState;
  }
}
