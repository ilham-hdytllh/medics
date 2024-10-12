import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/core/constants/text_strings.dart';
import 'package:medics/presentation/getx/onboarding/onboarding_controller.dart';

import '../../../core/constants/image_strings.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_pages.dart';
import 'widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // Horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: CustomImages.onBoardingImage1,
                title: CustomTexts.onBoardingTitle1,
                subTitle: CustomTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: CustomImages.onBoardingImage2,
                title: CustomTexts.onBoardingTitle2,
                subTitle: CustomTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: CustomImages.onBoardingImage3,
                title: CustomTexts.onBoardingTitle3,
                subTitle: CustomTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          // Skip button
          const OnBoardingSkip(),
          // Dot navigation page indicator
          const OnBoardingDotNavigation(),
          // Circular button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
