import 'package:dio/dio.dart';
import 'package:weather/src/const/const.dart';
import 'package:weather/src/models/models.dart' show Coord, OneCallResponse;

abstract class IForecastRepository {
  Future<OneCallResponse> forecastByCoord(Coord coord);
}

class ForecastRepository implements IForecastRepository {
  final Dio _dio;

  ForecastRepository(this._dio);

  @override
  Future<OneCallResponse> forecastByCoord(Coord coord) async {
    try {
      // add language

      const lang = 'en';

      final url =
          '${AppCredentials.baseUrl}/onecall?lat=${coord.lat}&lon=${coord.lon}&exclude=minutely&lang=$lang&appId=${AppCredentials.key}';

      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        return OneCallResponse.fromJson(response.data);
      }

      throw Exception(response.statusMessage);
    } catch (e) {
      throw Exception(e);
    }
  }
}
