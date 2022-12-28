import 'package:broker_portfolio/common/types/failure.dart';
import 'package:broker_portfolio/features/stock_market/data/repositories/stock_market_repository.dart';
import 'package:broker_portfolio/features/stock_market/domain/models/stock_market.dart';
import 'package:broker_portfolio/features/stock_market/domain/models/stock_market_request.dart';
import 'package:dartz/dartz.dart';

abstract class GetStockMarket {
  Future<Either<Failure, StockMarket>> call(StockMarketRequest req);
}

class GetStockMarketImp implements GetStockMarket {
  late StockMarketRepository _repository;

  GetStockMarketImp([StockMarketRepository? repository]) {
    _repository = repository ?? StockMarketRepositoryImp();
  }

  @override
  Future<Either<Failure, StockMarket>> call(StockMarketRequest req) async {
    return await _repository.get(req);
  }
}
