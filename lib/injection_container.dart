import 'package:app_with_location/core/utils/shared_preference_helper.dart';
import 'package:app_with_location/features/data/datasources/localization_datasource.dart';
import 'package:app_with_location/features/data/datasources/theme_datasource.dart';
import 'package:app_with_location/features/data/repositories/localization_repository.dart';
import 'package:app_with_location/features/data/repositories/theme_repository_impl.dart';
import 'package:app_with_location/features/domain/repositories/localization_repository_base.dart';
import 'package:app_with_location/features/domain/repositories/theme_repository_base.dart';
import 'package:app_with_location/features/domain/usecases/localization/get_current_localization_usecase.dart';
import 'package:app_with_location/features/domain/usecases/localization/set_current_localization_usecase.dart';
import 'package:app_with_location/features/domain/usecases/themes/get_theme_usecase.dart';
import 'package:app_with_location/features/domain/usecases/themes/set_theme_usecase.dart';
import 'package:app_with_location/features/presentation/bloc/localization_bloc/localization_bloc.dart';
import 'package:app_with_location/features/presentation/bloc/personalities_bloc/personalities_bloc.dart';
import 'package:app_with_location/features/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerLazySingleton(
    () => SharedPreferenceHelper().sharedPreferences,
  );

  serviceLocator.registerLazySingleton<LocalizationDataSourceBase>(
    () => LocalizationDataSourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<ThemeDataSourceBase>(
    () => ThemeDataSourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<LocalizationRepositoryBase>(
    () => LocalizationRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<ThemeRepositoryBase>(
    () => ThemeRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetCurrentLocalizationUsecase(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => SetCurrentLocalizationUsecase(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetCurrentAppThemeUsecase(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => SetCurrentAppThemeUsecase(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => LocalizationBloc(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => ThemeBloc(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => PersonalitiesBloc(),
  );
}
