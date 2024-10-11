import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/core/constants/text_strings.dart';
import 'package:medics/presentation/getx/onboarding/onboarding_controller.dart';

import '../../../core/constants/image_strings.dart';
import 'widgets/onboarding_dot_navigation_mobile.dart';
import 'widgets/onboarding_next_button_mobile.dart';
import 'widgets/onboarding_pages_mobile.dart';
import 'widgets/onboarding_skip_mobile.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // Horizontal scrollable pages
          GetX<OnBoardingController>(
              init: OnBoardingController(),
              initState: (_) {},
              builder: (controller) {
                return PageView(
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
                );
              }),
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