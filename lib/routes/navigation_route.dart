import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/presentation/pages/auth/update_password.dart';
import 'package:medics/presentation/pages/home/main.dart';
import 'package:medics/presentation/pages/profile/profile.dart';
import '../presentation/pages/auth/signup.dart';
import '../presentation/pages/auth/forgot_password.dart';
import '../presentation/pages/auth/login.dart';
import '../presentation/pages/auth/update_profile.dart';
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
    GetPage(name: AppLinks.HOMESCREEN, page: () => const MainScreen()),
    GetPage(name: AppLinks.PROFILE, page: () => ProfileScreen()),
    GetPage(
        name: AppLinks.UPDATEPROFILE, page: () => const UpdateProfileScreen()),
    GetPage(
        name: AppLinks.UPDATEPASSWORD,
        page: () => const UpdatePasswordScreen()),
  ];
}

class AppLinks {
  static const String ONBOARDING = "/onboarding";
  static const String LOGIN = "/login";
  static const String SIGNUP = "/signup";
  static const String FORGOTPASSWORD = "/forgotPassword";
  static const String VERIFYEMAILSCREEN = "/verifyEmail";
  static const String HOMESCREEN = "/homeScreen";
  static const String PROFILE = "/profile";
  static const String UPDATEPROFILE = "/updateProfile";
  static const String UPDATEPASSWORD = "/updatePassword";
}
