import 'dart:ui';

import 'package:app_with_location/core/errors/failures.dart';
import 'package:app_with_location/core/usecase/usecase.dart';
import 'package:app_with_location/features/domain/repositories/localization_repository_base.dart';
import 'package:dartz/dartz.dart';

class SetCurrentLocalizationUsecase implements Usecase<Unit, Locale> {
  final LocalizationRepositoryBase localizationRepository;

  SetCurrentLocalizationUsecase(this.localizationRepository);

  @override
  Future<Either<Failure, Unit>> call(Locale params) async {
    return await localizationRepository.setCurrentLocalization(params);
  }
}
