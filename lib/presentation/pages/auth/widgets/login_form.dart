import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medics/routes/navigation_route.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: CustomSizes.spaceBtwItems),
        child: Column(
          children: [
            // Email
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right), labelText: "Email"),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwInputFields,
            ),
            // Password
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: "Password",
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwInputFields / 2,
            ),

            // Remember Me & Forgot Pw
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Forget Pw
                TextButton(
                  onPressed: () => Get.toNamed(AppLinks.FORGOTPASSWORD),
                  child: Text(
                    "Lupa password ?",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: CustomColors.primary),
                  ),
                )
              ],
            ),

            const SizedBox(
              height: CustomSizes.spaceBtwInputFields,
            ),

            // Sign In Button
            SizedBox(
              height: CustomSizes.inputFieldHeight,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.toNamed(AppLinks.HOMESCREEN),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    foregroundColor: CustomColors.white,
                    backgroundColor: CustomColors.primary),
                child: Text(
                  "Masuk",
                ),
              ),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwItems,
            ),

            // Create Account Button
            SizedBox(
              height: CustomSizes.inputFieldHeight,
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.toNamed(AppLinks.SIGNUP),
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    foregroundColor: CustomColors.primary,
                    backgroundColor: Colors.transparent),
                child: Text(
                  "Buat Akun",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
