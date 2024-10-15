import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'app.dart';
import 'core/utils/helpers/notification_helper.dart';
import 'data/repositories/authentication/authentication_repository.dart';

void main() async {
  // Widget Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  NotificationHelper.init();

  // Await flutter native splash until other item load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Mengunci orientasi ke potret
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    // Mengatur gaya overlay sistem UI
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }).then(
    (value) => Get.put(AuthenticationRepository()),
  );

  runApp(const App());
}
