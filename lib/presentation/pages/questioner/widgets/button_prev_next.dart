import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';
import '../../../getx/questioner/questioner_controller.dart';

class ButtonPrevAndNext extends StatelessWidget {
  final controller = Get.find<QuestionerFirstController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          controller.index == 0
              ? SizedBox()
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.buttonSecondary,
                      foregroundColor: CustomColors.white),
                  onPressed: () {
                    controller.prevPage();
                  },
                  child: Text("Sebelumnya"),
                ),
          ElevatedButton(
            onPressed:
                controller.index.value < controller.questionFirstData.length - 1
                    ? () {
                        controller.nextPage();
                      }
                    : () {
                        print("submit");
                      },
            child: Text(
                controller.index.value < controller.questionFirstData.length - 1
                    ? "Selanjutnya"
                    : "Submit"),
          ),
        ],
      ),
    );
  }
}
