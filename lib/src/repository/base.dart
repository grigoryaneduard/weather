import 'package:dio/dio.dart';
import 'package:weather/src/const/const.dart';
import 'package:weather/src/models/models.dart' show BaseResponse, Coord;

abstract class IBaseRepository {
  Future<BaseResponse> getBaseInfoByLocation(String location);

  Future<BaseResponse> getBaseInfoByCoord(Coord coord);
}

class BaseRepository implements IBaseRepository {
  final Dio _dio;

  BaseRepository(this._dio);

  @override
  Future<BaseResponse> getBaseInfoByLocation(String location) async {
    final url =
        '${AppCredentials.baseUrl}/weather?q=$location&appId=${AppCredentials.key}';

    final response = await _dio.get(url);

    if (response.statusCode == 200) {
      return BaseResponse.fromJson(response.data);
    }

    throw Exception(response.statusMessage);
  }

  @override
  Future<BaseResponse> getBaseInfoByCoord(Coord coord) async {
    final url =
        '${AppCredentials.baseUrl}/weather?lat=${coord.lat}&lon=${coord.lon}&appId=${AppCredentials.key}';

    final response = await _dio.get(url);

    if (response.statusCode == 200) {
      return BaseResponse.fromJson(response.data);
    }

    throw Exception(response.statusMessage);
  }
}
