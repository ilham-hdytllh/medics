import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_pos_multimerchant/features/authentication/screens/login/login.dart';
import 'package:in_pos_multimerchant/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:in_pos_multimerchant/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:in_pos_multimerchant/features/authentication/screens/signup/signup.dart';
import 'package:in_pos_multimerchant/features/authentication/screens/signup/verify_email.dart';
import 'package:in_pos_multimerchant/features/authentication/screens/starting_setup/starting_setup_screen.dart';
import 'package:in_pos_multimerchant/features/create_order/screens/menu_order/menu_order.dart';
import 'package:in_pos_multimerchant/features/customer/screens/customer_add_screen.dart';
import 'package:in_pos_multimerchant/features/customer/screens/customer_screens.dart';
import 'package:in_pos_multimerchant/features/employe/screens/employe/employe_screen.dart';
import 'package:in_pos_multimerchant/features/inventory/screens/inventory_screen/inventory_screen.dart';
import 'package:in_pos_multimerchant/features/menu_and_category/screens/menu/menu_screens.dart';
import 'package:in_pos_multimerchant/features/navigation/screens/main_navigation/main_navigation.dart';
import 'package:in_pos_multimerchant/features/order/screens/list_order/list_order.dart';
import 'package:in_pos_multimerchant/features/promo/screens/promo/promo_screens.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: AppLinks.ONBOARDING, page: () => const OnboardingScreen()),
    GetPage(name: AppLinks.LOGIN, page: () => const LoginScreen()),
    GetPage(name: AppLinks.SIGNUP, page: () => const SignupScreen()),
    GetPage(
        name: AppLinks.FORGOTPASSWORD,
        page: () => const ForgetPasswordScreen()),
    GetPage(name: AppLinks.VERIFYEMAILSCREEN, page: () => VerifyEmailScreen()),
    GetPage(name: AppLinks.STARTINGSETUP, page: () => const StartingSetup()),
    GetPage(name: AppLinks.MAINNAVIGATION, page: () => const MainNavigation()),
    GetPage(name: AppLinks.CREATEORDER, page: () => const MenuOrderPage()),
    GetPage(name: AppLinks.ORDER, page: () => const ListOrderScreen()),
    GetPage(name: AppLinks.MENU, page: () => const MenuScreens()),
    GetPage(name: AppLinks.PROMO, page: () => const PromoScreen()),
    GetPage(name: AppLinks.STAFF, page: () => const EmployeScreen()),
    GetPage(name: AppLinks.INVENTORY, page: () => const InventoryScreen()),
    GetPage(name: AppLinks.BRANCH, page: () => const SizedBox()),
    GetPage(name: AppLinks.REPORT, page: () => const SizedBox()),
    GetPage(name: AppLinks.CUSTOMER, page: () => const CustomerScreen()),
    GetPage(name: AppLinks.ADDCUSTOMER, page: () => const AddCustomerScreen()),
  ];
}

class AppLinks {
  static const String ONBOARDING = "/onboarding";
  static const String LOGIN = "/login";
  static const String SIGNUP = "/signup";
  static const String FORGOTPASSWORD = "/forgotPassword";
  static const String VERIFYEMAILSCREEN = "/verifyEmail";
  static const String STARTINGSETUP = "/startingSetup";
  static const String MAINNAVIGATION = "/mainNavigation";
  static const String CREATEORDER = "/createOrder";
  static const String ORDER = "/order";
  static const String MENU = "/menu";
  static const String PROMO = "/promo";
  static const String STAFF = "/staff";
  static const String INVENTORY = "/inventory";
  static const String BRANCH = "/branch";
  static const String REPORT = "/report";
  static const String CUSTOMER = "/customer";
  static const String ADDCUSTOMER = "/addCustomer";
}
