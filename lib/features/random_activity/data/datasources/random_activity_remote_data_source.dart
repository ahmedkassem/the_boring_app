import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/random_activity_model.dart';

abstract class RandomActivityRemoteDataSource {
  Future<RandomActivityModel>? getRandomActivity();
}

class RandomActivityRemoteDataSourceImpl
    implements RandomActivityRemoteDataSource {
  final Dio dio;

  RandomActivityRemoteDataSourceImpl({required this.dio});

  @override
  Future<RandomActivityModel>? getRandomActivity() async {
    final response = await dio.get(
      'https://www.boredapi.com/api/activity',
      queryParameters: {
        'api_key': 'if you need',
      },
    );

    if (response.statusCode == 200) {
      return RandomActivityModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
