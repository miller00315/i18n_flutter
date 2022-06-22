import 'package:app_with_location/core/errors/failures.dart';
import 'package:app_with_location/features/data/datasources/theme_datasource.dart';
import 'package:app_with_location/features/domain/repositories/theme_repository_base.dart';
import 'package:dartz/dartz.dart';
import 'package:app_with_location/features/presentation/global/theme/app_themes.dart';

class ThemeRepositoryImpl implements ThemeRepositoryBase {
  final ThemeDataSourceBase themeDataSource;

  ThemeRepositoryImpl(this.themeDataSource);

  @override
  Future<Either<Failure, AppTheme>> getTheme() async {
    try {
      final theme = await themeDataSource.getTheme();

      return right(theme);
    } catch (e) {
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> setTheme(AppTheme params) async {
    try {
      await themeDataSource.setTheme(params);

      return right(unit);
    } catch (e) {
      return left(CacheFailure());
    }
  }
}
