part of 'localization_bloc.dart';

class LocalizationState extends Equatable {
  final Locale locale;

  const LocalizationState({required this.locale});

  factory LocalizationState.initial() =>
      const LocalizationState(locale: Locale('en'));

  @override
  List<Object> get props => [locale];

  LocalizationState copyWith({Locale? locale}) {
    return LocalizationState(locale: locale ?? this.locale);
  }
}
