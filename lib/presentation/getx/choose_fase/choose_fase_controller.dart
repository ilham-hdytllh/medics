import 'package:get/get.dart';
import 'package:medics/core/utils/helpers/shared_preference.dart';

import '../../../core/utils/helpers/alarm_helper.dart';
import '../../../routes/navigation_route.dart';

class ChooseFaseController extends GetxController {
  RxInt activeFase = 0.obs;

  void chooseFase(int fase) async {
    if (fase == 1) {
      activeFase.value = 1;
      await SharedPreferencesHelper.saveFase(1);
    } else {
      activeFase.value = 2;
      await SharedPreferencesHelper.saveFase(2);
    }

    Get.offNamed(AppLinks.HOMESCREEN);

    AlarmHelper alarmHelper = AlarmHelper();
    await alarmHelper.scheduleAlarm();
  }
}
