import 'package:app_with_location/features/presentation/global/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeDataSourceBase {
  Future setTheme(AppTheme params);

  Future<AppTheme> getTheme();
}

class ThemeDataSourceImpl implements ThemeDataSourceBase {
  final SharedPreferences sharedPreferences;

  ThemeDataSourceImpl(this.sharedPreferences);

  @override
  Future<AppTheme> getTheme() async {
    final themeIndex = sharedPreferences.getInt('theme');

    if (themeIndex == null) {
      return AppTheme.GreenLight;
    }

    return AppTheme.values[themeIndex];
  }

  @override
  Future setTheme(AppTheme params) async {
    final isSuccess = await sharedPreferences.setInt('theme', params.index);

    if (!isSuccess) {
      throw Exception('Theme doesn\'t saved');
    }
  }
}
