import 'package:dio/dio.dart';
import 'package:weather/src/const/const.dart';
import 'package:weather/src/models/base_response.dart';

abstract class IBaseRepository {
  Future<BaseResponse> getBaseInfo(String location);
}

class BaseRepository implements IBaseRepository {
  final Dio _dio;

  BaseRepository(this._dio);

  @override
  Future<BaseResponse> getBaseInfo(String location) async {
    final url =
        '${AppCredentials.baseUrl}/weather?q=$location&appId:${AppCredentials.key}';

    final response = await _dio.get(url);

    if (response.statusCode == 200) {
      return BaseResponse.fromJson(response.data);
    }

    throw Exception(response.statusMessage);
  }
}
