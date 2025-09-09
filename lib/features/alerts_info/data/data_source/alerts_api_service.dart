import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:learning_flutter/features/alerts_info/data/dto/alerts_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'alerts_api_service.g.dart';

@RestApi()
abstract class AlertsApiService {
  factory AlertsApiService(Dio dio, {String baseUrl}) = _AlertsApiService;

  @GET('/v1/alerts/active.json')
  Future<AlertsResponseDto> getAlertsForLocations(@Query('token') String token);

  @GET('/v1/alerts/active.json')
  Future<AlertsResponseDto> getActiveAlerts(@Query('token') String token);
}

class AlertsApiClient {
  static AlertsApiService create() {
    final dio = Dio();

    dio.options.baseUrl = 'https://api.alerts.in.ua';
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = dotenv.env['ALERTS_API_TOKEN'];
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          options.headers['Content-Type'] = 'application/json';
          handler.next(options);
        },
        onError: (error, handler) {
          handler.next(error);
        },
      ),
    );

    return AlertsApiService(dio);
  }
}
