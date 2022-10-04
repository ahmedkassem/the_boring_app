import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/random_activity.dart';
import '../repositories/random_activity_repository.dart';

class GetRandomActivity {
  final RandomActivityRepository repository;

  GetRandomActivity(this.repository);

  Future<Either<Failure, RandomActivity?>?> call(
    NoParams params,
  ) async {
    return await repository.getRandomActivity();
  }
}
