import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:in_pos_multimerchant/bindings/general_bindings.dart';
import 'package:in_pos_multimerchant/localization/translations.dart';
import 'package:in_pos_multimerchant/utils/constants/colors.dart';
import 'package:in_pos_multimerchant/utils/theme/theme.dart';

/// ----- Use this Class to setup themes, initial bindings, any animations and much ------
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale(
        'id',
        'ID',
      ),
      fallbackLocale: const Locale(
        'en',
        'US',
      ),
      initialBinding: GeneralBindings(),
      translations: Transalation(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      // initialRoute: AppLinks.MAINNAVIGATION,
      // getPages: AppRoutes.pages,
      home: const Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: TColors.white,
          ),
        ),
      ),
    );
  }
}
