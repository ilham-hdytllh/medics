import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medics/presentation/getx/alarm/alarm.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';

class AlarmNotif extends StatelessWidget {
  final controller = Get.find<AlarmController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Alarm"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('assets/images/drug.json', height: 350),
              Text(
                'Waktunya Minum Obat',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: CustomSizes.inputFieldHeight,
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () async {
                          controller.isLoading.value == false
                              ? await controller.snooze30()
                              : null;
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                          disabledBackgroundColor: CustomColors.white,
                          disabledForegroundColor: CustomColors.primary,
                          foregroundColor: CustomColors.primary,
                          backgroundColor: CustomColors.white,
                        ),
                        child: Text(
                          "Nanti",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: CustomSizes.inputFieldHeight,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          controller.isLoading.value == false
                              ? await controller.doneDrink()
                              : null;
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                          disabledBackgroundColor: CustomColors.grey,
                          disabledForegroundColor: CustomColors.primary,
                          foregroundColor: CustomColors.white,
                          backgroundColor: CustomColors.primary,
                        ),
                        child: controller.isLoading.value
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: CircularProgressIndicator(
                                      color: CustomColors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Please wait..",
                                  ),
                                ],
                              )
                            : Text(
                                "Sudah",
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
