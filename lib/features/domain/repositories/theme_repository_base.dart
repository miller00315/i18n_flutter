import 'package:app_with_location/core/errors/failures.dart';
import 'package:app_with_location/features/presentation/global/theme/app_themes.dart';
import 'package:dartz/dartz.dart';

abstract class ThemeRepositoryBase {
  Future<Either<Failure, AppTheme>> getTheme();

  Future<Either<Failure, Unit>> setTheme(AppTheme params);
}
