import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:medics/routes/navigation_route.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/utils/exceptions/format_exceptions.dart';
import '../../../core/utils/exceptions/platform_exceptions.dart';
import '../../../core/utils/helpers/shared_preference.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to show Relevant Screen
  screenRedirect() async {
    String? token = await SharedPreferencesHelper.getToken();
    if (token != null) {
      // if user is logged in
      Get.offAllNamed(AppLinks.HOMESCREEN);
    } else {
      // Local Storage
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAllNamed(AppLinks.LOGIN)
          : Get.offAllNamed(AppLinks.ONBOARDING);
    }
  }

  // Login
  Future<Map<String, dynamic>> loginEmail(String email, String password) async {
    try {
      // Make POST request to API
      final response = await http.post(
        Uri.parse(ContantAPI.loginEmail),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'username': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == true) {
          // Save token and user data in shared preferences
          await SharedPreferencesHelper.saveToken(data['token']);
          await SharedPreferencesHelper.saveUserData(data['data']);

          return {"status": data['status'], "message": data['message']};
        } else {
          return {"status": data['status'], "message": data['message']};
        }
      } else {
        throw "Login failed, please check your credential";
      }
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw "$e";
    }
  }

  // logout
  Future<void> logout(String? token) async {
    try {
      if (token != null) {
        // Make POST request to API
        final response = await http.post(
          Uri.parse(ContantAPI.logout),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token', // Set the authorization header
          },
        );

        switch (response.statusCode) {
          case 200:
            await SharedPreferencesHelper.clearToken();
            Get.offAllNamed(AppLinks.LOGIN);
          case 401:
            await SharedPreferencesHelper.clearToken();
            Get.offAllNamed(AppLinks.LOGIN);
            throw 'Session expired';
          case 403:
            await SharedPreferencesHelper.clearToken();
            Get.offAllNamed(AppLinks.LOGIN);
            throw 'Session expired';
          default:
            throw 'Failed logout: ${response.statusCode}';
        }
      } else {
        await SharedPreferencesHelper.clearToken();
        Get.offAllNamed(AppLinks.LOGIN);
        throw 'Session expired';
      }
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw "$e";
    }
  }
}
