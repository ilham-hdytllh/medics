import 'dart:convert';

import 'package:alarm/alarm.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:medics/routes/navigation_route.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/utils/exceptions/format_exceptions.dart';
import '../../../core/utils/exceptions/platform_exceptions.dart';
import '../../../core/utils/helpers/shared_preference.dart';
import '../../models/user.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to show Relevant Screen
  screenRedirect() async {
    String? token = await SharedPreferencesHelper.getToken();
    bool? isFirstTime = await SharedPreferencesHelper.isFirstTime();
    int? fase = await SharedPreferencesHelper.getFase();
    if (token != null) {
      if (fase == null) {
        Get.offAllNamed(AppLinks.CHOOSEFASE);
      } else {
        // if user is logged in
        Get.offAllNamed(AppLinks.HOMESCREEN);
      }
    } else {
      // Local Storage
      if (isFirstTime) {
        Get.offAllNamed(AppLinks.ONBOARDING);
      } else {
        Get.offAllNamed(AppLinks.LOGIN);
      }
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

      print(data);

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

  // Login Google
  Future<void> loginGoogle(String email) async {
    try {
      // Make POST request to API
      final response = await http.post(
        Uri.parse(ContantAPI.loginGoogle),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: json.encode({'email': email}),
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

  // Update Profile
  Future<void> updateProfile(
    String token,
    String name,
    String address,
    String phone,
  ) async {
    print(token);
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
      print(response.statusCode);
      switch (response.statusCode) {
        case 200:
          print("Sukses");
        case 401:
          await SharedPreferencesHelper.clearToken();
          await SharedPreferencesHelper.clearUserData();
          await SharedPreferencesHelper.clearFase();
          await SharedPreferencesHelper.clearBiodata();
          Alarm.stop(1);
          Get.offAllNamed(AppLinks.LOGIN);
          Get.deleteAll();
          throw 'Session expired';
        case 403:
          await SharedPreferencesHelper.clearToken();
          await SharedPreferencesHelper.clearUserData();
          await SharedPreferencesHelper.clearFase();
          await SharedPreferencesHelper.clearBiodata();
          Alarm.stop(1);
          Get.offAllNamed(AppLinks.LOGIN);
          Get.deleteAll();
          throw 'Session expired';
        default:
          throw "Update profile failed, please try again";
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

      final body = json.decode(response.body);
      switch (response.statusCode) {
        case 200:
          print("success");
        case 400:
          throw body['message'];
        case 401:
          await SharedPreferencesHelper.clearToken();
          await SharedPreferencesHelper.clearUserData();
          await SharedPreferencesHelper.clearFase();
          await SharedPreferencesHelper.clearBiodata();
          Alarm.stop(1);
          Get.offAllNamed(AppLinks.LOGIN);
          Get.deleteAll();
          throw 'Session expired';
        case 403:
          await SharedPreferencesHelper.clearToken();
          await SharedPreferencesHelper.clearUserData();
          await SharedPreferencesHelper.clearFase();
          await SharedPreferencesHelper.clearBiodata();
          Alarm.stop(1);
          Get.offAllNamed(AppLinks.LOGIN);
          Get.deleteAll();
          throw 'Session expired';
        default:
          throw "Update password failed, please try again";
      }
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw "$e";
    }
  }

  // Get Profile
  Future<UserModel> getProfile(String? token) async {
    try {
      // Make GET request to API
      final response = await http.get(
        Uri.parse(ContantAPI.getProfile),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      final body = json.decode(response.body);
      switch (response.statusCode) {
        case 200:
          // Decode the response body
          final Map<String, dynamic> data = body['data'];
          // Return the UserModel object
          return UserModel.fromJson(data);
        case 401:
          await SharedPreferencesHelper.clearToken();
          await SharedPreferencesHelper.clearUserData();
          await SharedPreferencesHelper.clearFase();
          await SharedPreferencesHelper.clearBiodata();
          Alarm.stop(1);
          Get.offAllNamed(AppLinks.LOGIN);
          Get.deleteAll();
          throw 'Session expired';
        case 403:
          await SharedPreferencesHelper.clearToken();
          await SharedPreferencesHelper.clearUserData();
          await SharedPreferencesHelper.clearFase();
          await SharedPreferencesHelper.clearBiodata();
          Alarm.stop(1);
          Get.offAllNamed(AppLinks.LOGIN);
          Get.deleteAll();
          throw 'Session expired';
        default:
          // Return the UserModel object
          return UserModel.empty();
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
            await SharedPreferencesHelper.clearUserData();
            await SharedPreferencesHelper.clearFase();
            await SharedPreferencesHelper.clearBiodata();
            Alarm.stop(1);
            Get.offAllNamed(AppLinks.LOGIN);
            Get.deleteAll();
          case 401:
            await SharedPreferencesHelper.clearToken();
            await SharedPreferencesHelper.clearUserData();
            await SharedPreferencesHelper.clearFase();
            await SharedPreferencesHelper.clearBiodata();
            Alarm.stop(1);
            Get.offAllNamed(AppLinks.LOGIN);
            Get.deleteAll();
            throw 'Session expired';
          case 403:
            await SharedPreferencesHelper.clearToken();
            await SharedPreferencesHelper.clearUserData();
            await SharedPreferencesHelper.clearFase();
            await SharedPreferencesHelper.clearBiodata();
            Alarm.stop(1);
            Get.offAllNamed(AppLinks.LOGIN);
            Get.deleteAll();
            throw 'Session expired';
          default:
            throw 'Failed logout: ${response.statusCode}';
        }
      } else {
        await SharedPreferencesHelper.clearToken();
        await SharedPreferencesHelper.clearUserData();
        await SharedPreferencesHelper.clearFase();
        await SharedPreferencesHelper.clearBiodata();
        Alarm.stop(1);
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
