
import 'package:broker_portfolio/services/http_client/domain/models/custom_request.dart';
import 'package:broker_portfolio/services/http_client/domain/models/custom_response.dart';

abstract class ClientService {
  Future<CustomResponse> get(CustomRequest request);
}
