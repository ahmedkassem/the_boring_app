import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/random_activity_model.dart';

abstract class RandomActivityLocalDataSource {
  Future<void>? cacheRandomActivity(RandomActivityModel? activityToCache);

  Future<RandomActivityModel>? getLastRandomActivity();
}

const cachedRandomActivity = 'CACHED_RANDOM_ACTIVIY';

class RandomActivityLocalDataSourceImpl
    implements RandomActivityLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomActivityLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<RandomActivityModel>? getLastRandomActivity() {
    final jsonString = sharedPreferences.getString(cachedRandomActivity);

    if (jsonString != null) {
      return Future.value(
          RandomActivityModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void>? cacheRandomActivity(RandomActivityModel? activityToCache) {
    if (activityToCache != null) {
      return sharedPreferences.setString(
          cachedRandomActivity, json.encode(activityToCache.toJson()));
    } else {
      throw CacheException();
    }
  }
}
