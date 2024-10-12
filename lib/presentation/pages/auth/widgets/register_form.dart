import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medics/presentation/pages/auth/widgets/term_condition.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

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
              height: CustomSizes.spaceBtwInputFields,
            ),

            // Term and Condition
            TermsAndConditionCheckbox(),

            const SizedBox(
              height: CustomSizes.spaceBtwInputFields,
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
                  "Daftar",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
