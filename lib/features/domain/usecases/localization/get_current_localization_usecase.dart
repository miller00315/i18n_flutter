import 'dart:ui';

import 'package:app_with_location/core/errors/failures.dart';
import 'package:app_with_location/core/usecase/usecase.dart';
import 'package:app_with_location/features/domain/repositories/localization_repository_base.dart';
import 'package:dartz/dartz.dart';

class GetCurrentLocalizationUsecase implements Usecase<Locale, NoParams> {
  final LocalizationRepositoryBase localizationRepository;

  GetCurrentLocalizationUsecase(this.localizationRepository);

  @override
  Future<Either<Failure, Locale>> call(NoParams params) async {
    return await localizationRepository.getCurrentLocalization();
  }
}
