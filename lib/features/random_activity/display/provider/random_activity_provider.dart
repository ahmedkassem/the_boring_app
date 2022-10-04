import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/datasources/random_activity_local_data_source.dart';
import '../../data/datasources/random_activity_remote_data_source.dart';
import '../../data/repositories/random_activity_repository_impl.dart';
import '../../domain/entities/random_activity.dart';
import '../../domain/usecases/get_random_activity.dart';

class RandomActivityProvider extends ChangeNotifier {
  RandomActivity? randomActivity;

  Failure? failure;

  RandomActivityProvider({
    this.randomActivity,
    this.failure,
  });

  void eitherFailureOrActivity() async {
    RandomActivityRepositoryImpl repository = RandomActivityRepositoryImpl(
      remoteDataSource: RandomActivityRemoteDataSourceImpl(dio: Dio()),
      localDataSource: RandomActivityLocalDataSourceImpl(
          sharedPreferences: await SharedPreferences.getInstance()),
      networkInfo: NetworkInfoImpl(DataConnectionChecker()),
    );

    final failureOrActivity =
        await GetRandomActivity(repository).call(NoParams());

    failureOrActivity?.fold(
      (newFailure) {
        randomActivity = null;

        failure = newFailure;

        notifyListeners();
      },
      (activity) {
        randomActivity = activity;

        failure = null;

        notifyListeners();
      },
    );
  }
}
