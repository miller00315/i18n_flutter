import 'package:app_with_location/core/usecase/usecase.dart';
import 'package:app_with_location/features/domain/usecases/themes/get_theme_usecase.dart';
import 'package:app_with_location/features/domain/usecases/themes/set_theme_usecase.dart';
import 'package:app_with_location/features/presentation/global/theme/app_themes.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetCurrentAppThemeUsecase getCurrentAppThemeUsecase;
  final SetCurrentAppThemeUsecase setCurrentAppThemeUsecase;

  ThemeBloc(
    this.getCurrentAppThemeUsecase,
    this.setCurrentAppThemeUsecase,
  ) : super(ThemeState.initial()) {
    on<ThemeEvent>((event, emit) async {
      if (event is ThemeChangedEvent) {
        final successOrFailure = await setCurrentAppThemeUsecase(event.theme);

        successOrFailure.fold(
          (failure) => print(failure),
          (_) => emit(state.copyWith(themeData: appThemeData[event.theme])),
        );
      }

      if (event is GetCurrentThemeEvent) {
        final successOrFailure = await getCurrentAppThemeUsecase(NoParams());

        successOrFailure.fold(
          (failure) => print(failure),
          (theme) => emit(state.copyWith(themeData: appThemeData[theme])),
        );
      }
    });
  }
}
