import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalizationDataSourceBase {
  Future<Locale> getCurrentLocale();
  Future setCurrentLocale(Locale locale);
}

class LocalizationDataSourceImpl implements LocalizationDataSourceBase {
  final SharedPreferences sharedPreferences;

  LocalizationDataSourceImpl(this.sharedPreferences);

  @override
  Future<Locale> getCurrentLocale() async {
    final locale = sharedPreferences.getString('locale');

    if (locale == null) {
      return await getCurrentLocale();
    }

    return Locale.fromSubtags(languageCode: locale);
  }

  @override
  Future setCurrentLocale(Locale locale) async {
    final isSuccess =
        await sharedPreferences.setString('locale', locale.languageCode);

    if (!isSuccess) {
      throw Exception('locale doesn\'t saved');
    }
  }
}
