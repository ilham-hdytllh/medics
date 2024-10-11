import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/presentation/pages/home/home.dart';
import '../presentation/pages/auth/signup.dart';
import '../presentation/pages/auth/forgot_password.dart';
import '../presentation/pages/auth/login.dart';
import '../presentation/pages/onboarding/onboarding.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: AppLinks.ONBOARDING, page: () => const OnBoardingScreen()),
    GetPage(name: AppLinks.LOGIN, page: () => const LoginScreen()),
    GetPage(name: AppLinks.SIGNUP, page: () => const SingUpScreen()),
    GetPage(
        name: AppLinks.FORGOTPASSWORD,
        page: () => const ForgotPasswordScreen()),
    GetPage(name: AppLinks.VERIFYEMAILSCREEN, page: () => SizedBox()),
    GetPage(name: AppLinks.HOMESCREEN, page: () => const HomeScreen()),
  ];
}

class AppLinks {
  static const String ONBOARDING = "/onboarding";
  static const String LOGIN = "/login";
  static const String SIGNUP = "/signup";
  static const String FORGOTPASSWORD = "/forgotPassword";
  static const String VERIFYEMAILSCREEN = "/verifyEmail";
  static const String HOMESCREEN = "/homeScreen";
}
