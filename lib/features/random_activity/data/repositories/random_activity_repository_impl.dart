import 'package:dartz/dartz.dart';
import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/random_activity.dart';
import '../../domain/repositories/random_activity_repository.dart';
import '../datasources/random_activity_local_data_source.dart';
import '../datasources/random_activity_remote_data_source.dart';

class RandomActivityRepositoryImpl implements RandomActivityRepository {
  final RandomActivityRemoteDataSource remoteDataSource;

  final RandomActivityLocalDataSource localDataSource;

  final NetworkInfo networkInfo;

  RandomActivityRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, RandomActivity?>> getRandomActivity() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteActivity = await remoteDataSource.getRandomActivity();

        localDataSource.cacheRandomActivity(remoteActivity);

        return Right(remoteActivity);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      }
    } else {
      try {
        final localActivity = await localDataSource.getLastRandomActivity();

        return Right(localActivity);
      } on CacheException {
        return Left(CacheFailure(errorMessage: 'This is a cache exception'));
      }
    }
  }
}
