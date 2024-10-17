import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medics/core/utils/helpers/shared_preference.dart';

import '../../../core/utils/helpers/alarm_helper.dart';
import '../../../routes/navigation_route.dart';

class ChooseFaseController extends GetxController {
  GlobalKey<FormState> biodataKey = GlobalKey<FormState>();
  final isLoading = false.obs;
  final isCustomJob = false.obs;
  RxInt activeFase = 0.obs;
  final nameController = TextEditingController().obs;
  final placeController = TextEditingController().obs;
  final dateController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final ageController = TextEditingController().obs;
  RxString selectedGender = 'Laki-Laki'.obs;
  RxString selectedEducation = 'Tidak Sekolah'.obs;
  RxString selectedJob = 'Petani'.obs;
  RxString selectedLive = 'Sendiri'.obs;
  RxString selectedPhase = 'Phase 1'.obs;
  List<String> gender = ['Laki-Laki', 'Perempuan'];
  List<String> education = [
    'Tidak Sekolah',
    'SD',
    'SMP',
    'SMU',
    'Diploma/Sarjana'
  ];
  List<String> job = [
    'Petani',
    'Pegawai Negeri',
    'Pelajar/Mahasiswa',
    'Wiraswasta',
    'Karyawan'
  ];
  List<String> live = ['Sendiri', 'Bersama Suami/Istri', 'Bersama Keluarga'];
  List<String> fase = ['Phase 1', 'Phase 2'];

  Future<void> chooseFase() async {
    // form validation
    if (!biodataKey.currentState!.validate()) {
      isLoading.value = false;
      return;
    }

    if (selectedPhase == 'Phase 1') {
      activeFase.value = 1;
      await SharedPreferencesHelper.saveFase(1);
    } else {
      activeFase.value = 2;
      await SharedPreferencesHelper.saveFase(2);
    }

    Map<String, dynamic> biodata = {
      'name': nameController.value.text.trim(),
      'place': placeController.value.text.trim(),
      'date': dateController.value.text.trim(),
      'address': addressController.value.text.trim(),
      'age': ageController.value.text.trim(),
      'gender': selectedGender.value,
      'education': selectedEducation.value,
      'job': selectedJob.value,
      'live': selectedLive.value,
      'phase': selectedPhase.value,
    };
    await SharedPreferencesHelper.saveBiodata(biodata);

    Get.offNamed(AppLinks.HOMESCREEN);

    AlarmHelper alarmHelper = AlarmHelper();
    await alarmHelper.scheduleAlarm();
  }

  Future<void> chooseDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      dateController.value.text =
          DateFormat('dd-MM-yyyy').format(selectedDate); // Format tanggal
    }
  }
}
