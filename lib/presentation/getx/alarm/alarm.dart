import 'package:get/get.dart';
import 'package:medics/core/utils/helpers/alarm_helper.dart';
import 'package:medics/core/utils/helpers/shared_preference.dart';

class AlarmController extends GetxController {
  RxInt faseValue = 1.obs;

  @override
  void onInit() async {
    super.onInit();

    int? fase = await SharedPreferencesHelper.getFase();

    faseValue.value = fase!;
  }

  void changeFase(int fase) async {
    faseValue.value = fase;
    await SharedPreferencesHelper.saveFase(fase);

    AlarmHelper alarm = AlarmHelper();

    await alarm.scheduleAlarm();

    Get.back();
  }
}
