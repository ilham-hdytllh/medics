import 'dart:io';

import 'package:alarm/alarm.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medics/core/utils/helpers/alarm_helper.dart';
import 'package:medics/core/utils/helpers/shared_preference.dart';
import 'package:medics/core/utils/sncakbar/snackbar.dart';

import '../../../data/repositories/medicine/medicine_repository.dart';

class AlarmController extends GetxController {
  RxInt faseValue = 1.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();

    int? fase = await SharedPreferencesHelper.getFase();

    faseValue.value = fase ?? 1;
  }

  void changeFase(int fase) async {
    faseValue.value = fase;
    await SharedPreferencesHelper.saveFase(fase);

    AlarmHelper alarm = AlarmHelper();

    await alarm.scheduleAlarm();

    Get.back();
  }

  Future<void> fecthRepo() async {
    String? token = await SharedPreferencesHelper.getToken();
    if (token != null) {
      String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
      String time = DateFormat('HH:mm').format(DateTime.now());

      MediciniRepository controller = MediciniRepository();
      await controller.medicinePost(token, date, time);

      AlarmHelper alarmHelper = AlarmHelper();
      await alarmHelper.scheduleAlarm();
    }
  }

  Future<void> snooze30() async {
    await Alarm.stop(1);

    // Ambil waktu saat ini dan tambahkan 30 menit
    DateTime snoozeTime = await DateTime.now().add(Duration(minutes: 30));

    await Alarm.set(
      alarmSettings: AlarmSettings(
        id: 1,
        dateTime: snoozeTime,
        assetAudioPath: 'assets/sounds/alarm.mp3',
        loopAudio: true,
        vibrate: true,
        volume: 0.2,
        fadeDuration: 3.0,
        warningNotificationOnKill: Platform.isAndroid,
        androidFullScreenIntent: true,
        notificationSettings: const NotificationSettings(
          title: 'Pengingat!!!',
          body: 'Sudah waktunya minum obat, ayo segera minum obat.',
          stopButton: null,
          icon: 'app_icon',
        ),
      ),
    );

    Get.back();
  }

  Future<void> doneDrink() async {
    try {
      await fecthRepo();
      Get.back();
    } catch (e) {
      CustomSnackbar.errorSnackbar(
          title: "Error", message: "Terjadi kesalahan silahkan coba lagi.");
    }
  }
}
