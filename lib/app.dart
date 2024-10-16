import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'bindings/general_bindings.dart';
import 'core/constants/colors.dart';
import 'core/theme/theme.dart';
import 'routes/navigation_route.dart';

/// ----- Use this Class to setup themes, initial bindings, any animations and much ------
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GeneralBindings(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: CustomAppTheme.lightTheme,
      darkTheme: CustomAppTheme.lightTheme,
      initialRoute: AppLinks.ONBOARDING,
      getPages: AppRoutes.pages,
      home: const Scaffold(
        backgroundColor: CustomColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: CustomColors.white,
          ),
        ),
      ),
    );
  }
}
