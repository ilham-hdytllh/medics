import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medics/core/constants/colors.dart';
import 'package:medics/presentation/getx/choose_fase/choose_fase_controller.dart';

import '../../../core/constants/image_strings.dart';
import '../../../core/constants/sizes.dart';

class ChooseFaseScreen extends StatelessWidget {
  const ChooseFaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faseController = Get.put(ChooseFaseController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Phase"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                CustomImages.medical,
                height: 125,
                fit: BoxFit.fitHeight,
              ),
              SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),
              SizedBox(
                height: CustomSizes.inputFieldHeight,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => faseController.chooseFase(1),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    disabledBackgroundColor: CustomColors.grey,
                    disabledForegroundColor: CustomColors.primary,
                    foregroundColor: CustomColors.white,
                    backgroundColor: CustomColors.primary,
                  ),
                  child: Text(
                    "Select phase 1",
                  ),
                ),
              ),
              SizedBox(
                height: CustomSizes.spaceBtwItems,
              ),
              SizedBox(
                height: CustomSizes.inputFieldHeight,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => faseController.chooseFase(2),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    disabledBackgroundColor: CustomColors.white,
                    disabledForegroundColor: CustomColors.grey,
                    foregroundColor: CustomColors.primary,
                    backgroundColor: CustomColors.white,
                  ),
                  child: Text(
                    "Select phase 2",
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
