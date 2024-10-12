import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medics/core/constants/colors.dart';
import 'package:medics/core/constants/image_strings.dart';
import 'package:medics/core/utils/helpers/shared_preference.dart';
import 'package:medics/data/repositories/authentication/authentication_repository.dart';
import 'package:medics/routes/navigation_route.dart';

import '../../../core/constants/sizes.dart';
import 'widgets/profile_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primary.withOpacity(0.8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Stack(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage(CustomImages.emptyProfile),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.white),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Iconsax.camera,
                        size: CustomSizes.md,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Amelia Renata",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: CustomColors.white,
                      ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 550,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(children: [
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppLinks.UPDATEPROFILE),
                  child: ProfileList(
                    icon: IconlyBold.profile,
                    title: "Profile",
                    color: Colors.black87,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Divider(),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppLinks.UPDATEPASSWORD),
                  child: ProfileList(
                    icon: IconlyBold.lock,
                    title: "Password",
                    color: Colors.black87,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Divider(),
                ),
                GestureDetector(
                  onTap: () async {
                    String? token = await SharedPreferencesHelper.getToken();

                    await AuthenticationRepository.instance.logout(token);
                  },
                  child: ProfileList(
                    icon: IconlyBold.logout,
                    title: "Keluar",
                    color: Colors.black87,
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
