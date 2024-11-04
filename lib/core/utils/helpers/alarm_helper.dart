import 'dart:async';
import 'dart:io';
import 'package:alarm/alarm.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:medics/core/utils/helpers/shared_preference.dart';
import 'package:permission_handler/permission_handler.dart';

class AlarmHelper {
  static init() async {
    await Alarm.init();
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();

    final statusBattery = await Permission.ignoreBatteryOptimizations.status;
    if (statusBattery.isDenied) {
      await Permission.ignoreBatteryOptimizations.request();
    }

    final status = await Permission.scheduleExactAlarm.status;
    if (status.isDenied) {
      await Permission.scheduleExactAlarm.request();
    }

    Alarm.ringStream.stream.listen((alarm) async {
      print('listen');
      Get.toNamed('/alarmScreen');
    });
  }

  Future<void> scheduleAlarm() async {
    print('schedule alarm');
    // Mendapatkan fase dari SharedPreferences
    int? fase = await SharedPreferencesHelper.getFase();
    DateTime now = DateTime.now();
    DateTime dateTime;

    // Menentukan waktu alarm untuk jam 7 pagi
    dateTime = DateTime(now.year, now.month, now.day, 7);

    // Logika untuk fase 1
    if (fase == 1) {
      print('Alarm fase 1: Set alarm setiap hari jam 7 pagi');

      // Jika waktu sekarang sudah lewat dari jam 7 pagi, set untuk besok
      if (now.isAfter(dateTime)) {
        dateTime = dateTime.add(Duration(days: 1));
      }

      final alarmSettings = createAlarmSettings(dateTime);

      // Set alarm
      await Alarm.set(alarmSettings: alarmSettings);
    } else if (fase == 2) {
      print('Alarm fase 2: Set alarm hanya pada hari Selasa, Kamis, dan Sabtu');

      // Cek jika sekarang adalah hari yang diizinkan
      if (now.weekday == DateTime.tuesday ||
          now.weekday == DateTime.thursday ||
          now.weekday == DateTime.saturday) {
        // Jika waktu sekarang sudah lewat dari jam 7 pagi, set untuk besok
        if (now.isAfter(dateTime)) {
          dateTime = dateTime.add(Duration(days: 1));
        }

        final alarmSettings = createAlarmSettings(dateTime);

        // Set alarm
        await Alarm.set(alarmSettings: alarmSettings);
      } else {
        // Jika hari ini bukan hari yang diizinkan, cari hari selanjutnya yang diizinkan
        dateTime = getNextAllowedDateTime(now);

        final alarmSettings = createAlarmSettings(dateTime);

        // Set alarm
        await Alarm.set(alarmSettings: alarmSettings);
      }
    }
  }

// Fungsi untuk membuat pengaturan alarm
  AlarmSettings createAlarmSettings(DateTime dateTime) {
    return AlarmSettings(
      id: 1,
      dateTime: dateTime,
      assetAudioPath: 'assets/sounds/alarm.mp3',
      loopAudio: true,
      vibrate: true,
      volume: 0.2,
      fadeDuration: 3.0,
      warningNotificationOnKill: Platform.isIOS,
      androidFullScreenIntent: true,
      notificationSettings: const NotificationSettings(
        title: 'Pengingat!!!',
        body: 'Sudah waktunya minum obat, ayo segera minum obat.',
        stopButton: '',
        icon: 'app_icon',
      ),
    );
  }

  // Fungsi untuk mendapatkan tanggal dan waktu berikutnya yang diizinkan
  DateTime getNextAllowedDateTime(DateTime now) {
    DateTime nextDateTime;

    if (now.weekday < DateTime.tuesday) {
      nextDateTime = DateTime(now.year, now.month, now.day, 7)
          .add(Duration(days: DateTime.tuesday - now.weekday));
    } else if (now.weekday < DateTime.thursday) {
      nextDateTime = DateTime(now.year, now.month, now.day, 7)
          .add(Duration(days: DateTime.thursday - now.weekday));
    } else if (now.weekday < DateTime.saturday) {
      nextDateTime = DateTime(now.year, now.month, now.day, 7)
          .add(Duration(days: DateTime.saturday - now.weekday));
    } else {
      // Jika sudah hari minggu, set untuk hari selasa berikutnya
      nextDateTime = DateTime(now.year, now.month, now.day, 7)
          .add(Duration(days: (DateTime.tuesday - now.weekday + 7) % 7));
    }

    return nextDateTime;
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
}
