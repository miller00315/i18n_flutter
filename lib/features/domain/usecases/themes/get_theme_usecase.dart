import 'package:app_with_location/core/errors/failures.dart';
import 'package:app_with_location/core/usecase/usecase.dart';
import 'package:app_with_location/features/domain/repositories/theme_repository_base.dart';
import 'package:app_with_location/features/presentation/global/theme/app_themes.dart';
import 'package:dartz/dartz.dart';

class GetCurrentAppThemeUsecase implements Usecase<AppTheme, NoParams> {
  final ThemeRepositoryBase themeRepository;

  GetCurrentAppThemeUsecase(this.themeRepository);

  @override
  Future<Either<Failure, AppTheme>> call(NoParams params) async {
    return await themeRepository.getTheme();
  }
}
