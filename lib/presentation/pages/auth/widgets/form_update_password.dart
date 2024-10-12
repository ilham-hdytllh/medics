import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';

class FormUpdatePassword extends StatelessWidget {
  const FormUpdatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: CustomSizes.spaceBtwItems),
        child: Column(
          children: [
            // Password Old
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: "Password Sebelumnya",
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwSections,
            ),
            // Password New
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: "Password Baru",
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
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
                  "Ubah",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
