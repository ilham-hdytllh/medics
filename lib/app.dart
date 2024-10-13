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
      // onGenerateRoute: (routes) {
      //   switch (routes.name) {
      //     case AppLinks.ONBOARDING:
      //       return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      //     case AppLinks.LOGIN:
      //       return MaterialPageRoute(builder: (_) => const LoginScreen());
      //     case AppLinks.SIGNUP:
      //       return MaterialPageRoute(builder: (_) => const SingUpScreen());
      //     case AppLinks.FORGOTPASSWORD:
      //       return MaterialPageRoute(
      //           builder: (_) => const ForgotPasswordScreen());
      //     case AppLinks.HOMESCREEN:
      //       return MaterialPageRoute(builder: (_) => const MainScreen());
      //     case AppLinks.PROFILE:
      //       return MaterialPageRoute(builder: (_) => const ProfileScreen());
      //     case AppLinks.UPDATEPROFILE:
      //       return MaterialPageRoute(
      //           builder: (_) => const UpdateProfileScreen());
      //     case AppLinks.UPDATEPASSWORD:
      //       return MaterialPageRoute(
      //           builder: (_) => const UpdatePasswordScreen());
      //     case AppLinks.ALARM:
      //       return MaterialPageRoute(builder: (_) => const AlarmScreen());
      //     default:
      //       return MaterialPageRoute(builder: (_) => const SizedBox());
      //   }
      // },
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
