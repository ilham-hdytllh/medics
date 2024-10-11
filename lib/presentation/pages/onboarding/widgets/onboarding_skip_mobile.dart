import 'package:flutter/material.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/utils/device/device_utility.dart';
import '../../../getx/onboarding/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: CustomDeviceUtils.getAppBarHeight(),
      right: CustomSizes.defaultSpace,
      child: GestureDetector(
        onTap: () => OnBoardingController.instance.skipPage(),
        child: const Text("Skip"),
      ),
    );
  }
}
