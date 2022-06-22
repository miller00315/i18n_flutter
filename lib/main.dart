import 'package:app_with_location/core/utils/shared_preference_helper.dart';
import 'package:app_with_location/features/presentation/app.dart';
import 'package:app_with_location/injection_container.dart' as serviceLocator;
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferenceHelper().init();

  await serviceLocator.init();

  /// [DevicePreview] permite que vizualize-se na tela uma visão inicial de
  /// como o app irá comportar-se em diversas resoluções de telas
  /// muito útil para test de responsividade
  runApp(
    DevicePreview(
      builder: (_) => const App(),
    ),
  );
}
