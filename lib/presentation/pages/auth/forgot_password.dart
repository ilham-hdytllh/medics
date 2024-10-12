import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';
import 'widgets/auth_header.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(CustomSizes.defaultSpacePadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo app, title, sub title
              AuthHeader(
                title: "Reset Password",
                subTitle:
                    "Silahkan masukkan email terdaftar untuk reset password",
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
                height: CustomSizes.spaceBtwSections,
              ),

              // Create Account Button
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
                    "Reset",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
