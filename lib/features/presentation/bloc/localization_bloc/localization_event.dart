part of 'localization_bloc.dart';

abstract class LocalizationEvent extends Equatable {
  const LocalizationEvent();

  @override
  List<Object> get props => [];
}

class ChangeLocalizationEvent extends LocalizationEvent {
  final Locale locale;

  const ChangeLocalizationEvent(this.locale);

  @override
  List<Object> get props => [locale];

  @override
  String toString() => '''
  ChangeLocalizationEvent {
    locale: $locale
  }
  ''';
}

class GetCurrentLocalization extends LocalizationEvent {}
