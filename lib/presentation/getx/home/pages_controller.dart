import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PagesController extends GetxController {
  static PagesController get instance => Get.find();

  // Variable
  RxInt currentPage = 0.obs;
  final pageController = PageController();

  void changePage(int index) {
    currentPage.value = index;
    pageController.jumpToPage(index);
  }
}
