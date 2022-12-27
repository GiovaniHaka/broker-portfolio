import 'package:broker_portfolio/common/constants/endpoints/yahoo_finances_api.dart';
import 'package:broker_portfolio/common/types/failure.dart';
import 'package:broker_portfolio/features/stock_market/domain/models/stock_market_request.dart';
import 'package:broker_portfolio/services/http_client/domain/models/custom_request.dart';
import 'package:broker_portfolio/services/http_client/domain/models/custom_response.dart';
import 'package:broker_portfolio/services/http_client/domain/usecases/http_client.dart';
import 'package:dartz/dartz.dart';

abstract class StockMarketSource {
  Future<Either<Failure, Map<String, dynamic>>> get(StockMarketRequest req);
}

class StockMarketSourceImp implements StockMarketSource {
  late HttpClient _httpClient;

  StockMarketSourceImp([HttpClient? httpClient]) {
    _httpClient = httpClient ?? HttpClietImp();
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> get(StockMarketRequest req) async {
    try {
      String path = YahooFinancesApi.base;
      path = '$path/${req.symbol}';

      final request = CustomRequest(
        path,
        queryParameters: req.queryParametersToMap(),
      );

      final response = await _httpClient.get(request);
      final status = response.status;
      final data = response.data;

      switch (status) {
        case ResponseStatus.success:
          return Right(data!);
        case ResponseStatus.badRequest:
          return Left(Failure(
            'Não conseguimos encontrar os dados deste ativo',
          ));
        case ResponseStatus.unknown:
          return Left(Failure(
            'Não conseguimos encontrar o ativo',
          ));
        case ResponseStatus.error:
          return Left(Failure(
            'Erro ao encontrar ativo',
          ));
        default:
          throw UnimplementedError('$status not implemented');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
