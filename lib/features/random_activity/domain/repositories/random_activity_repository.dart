import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/random_activity.dart';

abstract class RandomActivityRepository {
  Future<Either<Failure, RandomActivity?>>? getRandomActivity();
}
