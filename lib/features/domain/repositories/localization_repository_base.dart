import 'dart:ui';

import 'package:app_with_location/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class LocalizationRepositoryBase {
  Future<Either<Failure, Locale>> getCurrentLocalization();
  Future<Either<Failure, Unit>> setCurrentLocalization(Locale locale);
}
