import 'package:broker_portfolio/common/types/failure.dart';
import 'package:broker_portfolio/features/stock_market/data/sources/stock_market_source.dart';
import 'package:broker_portfolio/features/stock_market/domain/models/stock_market.dart';
import 'package:broker_portfolio/features/stock_market/domain/models/stock_market_request.dart';
import 'package:dartz/dartz.dart';

abstract class StockMarketRepository {
  Future<Either<Failure, StockMarket>> get(StockMarketRequest req);
}

class StockMarketRepositoryImp implements StockMarketRepository {
  late StockMarketSource _source;

  StockMarketRepositoryImp([StockMarketSource? source]) {
    _source = source ?? StockMarketSourceImp();
  }

  @override
  Future<Either<Failure, StockMarket>> get(StockMarketRequest req) async {
    final result = await _source.get(req);

    return result.fold(
      (failure) => Left(failure),
      (data) {
        final results = data['chart']['result'] as List;
        final result = results.first;
        final stockMarket = StockMarket.fromMap(result);

        return Right(stockMarket);
      },
    );
  }
}
