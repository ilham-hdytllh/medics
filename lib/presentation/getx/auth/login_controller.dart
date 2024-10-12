import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/helpers/network_manager.dart';
import '../../../core/utils/sncakbar/snackbar.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // Variable
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxBool obsecure = true.obs;
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;

  // Singup
  Future<void> singinWithEmailPassword() async {
    try {
      // start loading
      isLoading.value = true;

      // check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading.value = false;
        return;
      }

      // form validation
      if (!loginKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }

      // Register user in the firebase auth & save data in firebase
      await AuthenticationRepository.instance
          .loginEmail(email.value.text.trim(), password.value.text.trim());

      // clear all controller
      email.value.clear();
      password.value.clear();
      obsecure.value = true;

      // Redirect screen
      await AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // show message generic eror to user
      CustomSnackbar.errorSnackbar(title: "Error", message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }
}
