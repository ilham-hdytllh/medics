import 'dart:io';
import 'package:alarm/alarm.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:auto_start_flutter/auto_start_flutter.dart';

class AlarmHelper {
  static init() async {
    await Alarm.init();
    // await initAutoStart();
    final status = await Permission.scheduleExactAlarm.status;
    if (status.isDenied) {
      await Permission.scheduleExactAlarm.request();
    }

    // await initAutoStart();

    // Mendapatkan waktu sekarang dan mengaturnya ke jam 9:33 pagi waktu lokal
    DateTime now = DateTime.now();
    DateTime dateTime = DateTime(now.year, now.month, now.day, 13, 25);

    final alarmSettings = AlarmSettings(
      id: 1,
      dateTime: dateTime,
      assetAudioPath: 'assets/sounds/alarm.mp3',
      loopAudio: true,
      vibrate: true,
      volume: 0.8,
      fadeDuration: 3.0,
      warningNotificationOnKill: Platform.isIOS,
      androidFullScreenIntent: true,
      notificationSettings: const NotificationSettings(
        title: 'Pengingat!!!',
        body:
            'Sudah waktunya minum obat, ayo segera minum obat pastikan jangan sampai terlambat.',
        stopButton: 'Stop Alarm',
        icon: 'app_icon',
      ),
    );

    // await Alarm.set(alarmSettings: alarmSettings);
  }
}

// Future<void> initAutoStart() async {
//   try {
//     //check auto-start availability.
//     var test = await (isAutoStartAvailable as FutureOr<bool>);
//     print(test);
//     //if available then navigate to auto-start setting page.
//     if (test) await getAutoStartPermission();
//   } on PlatformException catch (e) {
//     print(e);
//   }
// }

// void alarmCallback() {
//   NotificationHelper.showInstantNotification('Pengingat!!!',
//       'Sudah waktunya minum obat, ayo segera minum obat pastikan jangan sampai terlambat.');
// }
