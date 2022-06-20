import 'package:app_with_location/core/errors/failures.dart';
import 'package:app_with_location/features/data/datasources/localization_datasource.dart';
import 'dart:ui';

import 'package:app_with_location/features/domain/repositories/localization_repository_base.dart';
import 'package:dartz/dartz.dart';

class LocalizationRepositoryImpl implements LocalizationRepositoryBase {
  final LocalizationDataSourceBase localizationDataSource;

  LocalizationRepositoryImpl(this.localizationDataSource);

  @override
  Future<Either<Failure, Locale>> getCurrentLocalization() async {
    try {
      final locale = await localizationDataSource.getCurrentLocale();

      return right(locale);
    } catch (e) {
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> setCurrentLocalization(Locale locale) async {
    try {
      await localizationDataSource.setCurrentLocale(locale);

      return right(unit);
    } catch (e) {
      return left(CacheFailure());
    }
  }
}
