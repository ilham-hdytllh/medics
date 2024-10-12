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
    print(deviceStorage.read('isFirstTime'));
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
  Future<void> loginEmail(String email, String password) async {
    try {
      // Make POST request to API
      final response = await http.post(
        Uri.parse(ContantAPI.loginEmail),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      final data = json.decode(response.body);

      if (response.statusCode == 401) {
        throw data['message'];
      } else if (response.statusCode == 200) {
        // Save token and user data in shared preferences
        await SharedPreferencesHelper.saveToken(data['access_token']);
        await SharedPreferencesHelper.saveUserData(data['user']);
      } else {
        throw "Login failed, something when wrong";
      }
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw "$e";
    }
  }

  // Register
  Future<void> register(String name, String email, String password) async {
    try {
      // Make POST request to API
      final response = await http.post(
        Uri.parse(ContantAPI.signup),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );
      final data = json.decode(response.body);
      if (response.statusCode == 409) {
        throw data['message'];
      } else if (response.statusCode != 201) {
        throw "Failed register,something when wrong";
      }
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      print(e);
      throw "$e";
    }
  }

  // Forgot Password
  Future<void> forgotPassword(String email) async {
    try {
      // Make POST request to API
      final response = await http.post(
        Uri.parse(ContantAPI.forgotPassword),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: json.encode({'email': email}),
      );
      final data = json.decode(response.body);
      if (response.statusCode != 200) {
        throw data["message"];
      }
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw "$e";
    }
  }

  // Forgot Password
  Future<void> updateProfile(
    String token,
    String name,
    String address,
    String phone,
  ) async {
    try {
      // Make POST request to API
      final response = await http.put(
        Uri.parse(ContantAPI.updateProfile),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Set the authorization header
        },
        body: json.encode({'name': name, 'address': address, 'phone': phone}),
      );

      if (response.statusCode != 200) {
        throw "Reset passoword failed, please try again";
      }
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw "$e";
    }
  }

  // Update Password
  Future<void> updatePassword(
      String token, String currentPassword, String newPassword) async {
    try {
      // Make POST request to API
      final response = await http.put(
        Uri.parse(ContantAPI.updatePassword),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Set the authorization header
        },
        body: json.encode(
            {'current_password': currentPassword, 'new_password': newPassword}),
      );

      if (response.statusCode != 200) {
        throw "Reset passoword failed, please try again";
      }
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw "$e";
    }
  }

  // Update Password
  Future<void> getProfile(String token) async {
    try {
      // Make POST request to API
      final response = await http.get(
        Uri.parse(ContantAPI.getProfile),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode != 200) {
        throw "Reset passoword failed, please try again";
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
