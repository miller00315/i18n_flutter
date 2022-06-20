import 'package:app_with_location/core/utils/shared_preference_helper.dart';
import 'package:app_with_location/features/presentation/app.dart';
import 'package:app_with_location/injection_container.dart' as serviceLocator;
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferenceHelper().init();

  await serviceLocator.init();

  runApp(const App());
}
