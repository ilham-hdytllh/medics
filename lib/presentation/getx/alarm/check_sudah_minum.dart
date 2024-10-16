import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medics/core/constants/image_strings.dart';
import 'package:medics/core/constants/sizes.dart';

import '../../../core/constants/colors.dart';

class ChekingDring extends StatelessWidget {
  const ChekingDring({super.key});

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    disabledBackgroundColor: CustomColors.grey,
                    disabledForegroundColor: CustomColors.primary,
                    foregroundColor: CustomColors.white,
                    backgroundColor: CustomColors.primary,
                  ),
                  child: Text(
                    "Sudah minum obat",
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
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    disabledBackgroundColor: CustomColors.white,
                    disabledForegroundColor: CustomColors.grey,
                    foregroundColor: CustomColors.primary,
                    backgroundColor: CustomColors.white,
                  ),
                  child: Text(
                    "Belum minum obat",
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
