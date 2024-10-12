import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';

class FormUpdateProfile extends StatelessWidget {
  const FormUpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: CustomSizes.spaceBtwItems),
        child: Column(
          children: [
            // Nama
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user), labelText: "Nama"),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwInputFields,
            ),
            // Email
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right), labelText: "Email"),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwInputFields,
            ),
            // Telphone
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(IconlyLight.call), labelText: "Telphone"),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwInputFields,
            ),
            // Address
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(IconlyLight.location), labelText: "Alamat"),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwSections,
            ),

            // Sign In Button
            SizedBox(
              height: CustomSizes.inputFieldHeight,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    foregroundColor: CustomColors.white,
                    backgroundColor: CustomColors.primary),
                child: Text(
                  "Simpan",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
