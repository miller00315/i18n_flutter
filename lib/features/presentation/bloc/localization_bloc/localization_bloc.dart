import 'dart:ui';

import 'package:app_with_location/core/usecase/usecase.dart';
import 'package:app_with_location/features/domain/usecases/localization/get_current_localization_usecase.dart';
import 'package:app_with_location/features/domain/usecases/localization/set_current_localization_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final SetCurrentLocalizationUsecase setCurrentLocalizationUsecase;
  final GetCurrentLocalizationUsecase getCurrentLocalizationUsecase;

  LocalizationBloc(
    this.setCurrentLocalizationUsecase,
    this.getCurrentLocalizationUsecase,
  ) : super(LocalizationState.initial()) {
    on<LocalizationEvent>((event, emit) async {
      if (event is ChangeLocalizationEvent) {
        emit(state.copyWith(locale: event.locale));

        final failureOrSuccess =
            await setCurrentLocalizationUsecase(event.locale);

        failureOrSuccess.fold(
          (failure) => print(failure),
          (_) => print('salvo'),
        );
      }

      if (event is GetCurrentLocalization) {
        final failureOrSuccess =
            await getCurrentLocalizationUsecase(NoParams());

        failureOrSuccess.fold(
          (failure) => print(failure),
          (locale) => emit(state.copyWith(locale: locale)),
        );
      }
    });
  }
}
