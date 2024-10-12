import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/core/utils/helpers/shared_preference.dart';
import 'package:medics/routes/navigation_route.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update current index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the spesific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  /// Update current index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      SharedPreferencesHelper.setFirstTime(false);

      Get.offAllNamed(AppLinks.LOGIN);
    } else {
      int page = currentPageIndex.value + 1;
      pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  /// Update current index & jump to the last page
  void skipPage() {
    currentPageIndex.value = 2; // Mengubah nilai currentPageIndex menjadi 2
    pageController.animateToPage(
      2, // Langsung melompat ke halaman 2
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
