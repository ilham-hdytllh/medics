import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medics/core/utils/helpers/shared_preference.dart';
import 'package:medics/data/repositories/biodata/biodata_repository.dart';
import '../../../core/utils/helpers/alarm_helper.dart';
import '../../../data/models/biodata.dart';

class CompleteBiodataUpdateController extends GetxController {
  final isLoading = false.obs;
  final isCustomJob = false.obs;
  RxInt activeFase = 0.obs;
  final nameController = TextEditingController().obs;
  final placeController = TextEditingController().obs;
  final dateController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final ageController = TextEditingController().obs;
  final jobController = TextEditingController().obs;
  RxString selectedGender = 'Laki-Laki'.obs;
  RxString selectedEducation = 'Tidak Sekolah'.obs;
  RxString selectedJob = 'Petani'.obs;
  RxString selectedLive = 'Sendiri'.obs;
  RxString selectedPhase = 'Fase Awal'.obs;
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
  List<String> fase = ['Fase Awal', 'Fase Lanjutan'];

  @override
  void onInit() async {
    super.onInit();
    await getAndStoreToController();
  }

  Future<void> getAndStoreToController() async {
    String? token = await SharedPreferencesHelper.getToken();
    BiodataModel? biodata = await BiodataRepository.instance.getBiodata(token);

    if (biodata != null) {
      nameController.value.text = biodata.nama ?? "";
      placeController.value.text = biodata.tempatLahir ?? "";
      dateController.value.text = biodata.tanggalLahir ?? "";
      addressController.value.text = biodata.alamat ?? "";
      ageController.value.text =
          biodata.usia == null ? '' : biodata.usia.toString();
      selectedGender.value = biodata.jenisKelamin ?? selectedGender.value;
      selectedEducation.value = biodata.pendidikan ?? selectedEducation.value;
      selectedLive.value = biodata.statusTinggal ?? selectedLive.value;
      selectedPhase.value = biodata.fase ?? selectedPhase.value;
      if (biodata.pekerjaan == null) {
        isCustomJob.value = false;
        selectedJob.value = biodata.pekerjaan ?? selectedJob.value;
      } else if (job.contains(biodata.pekerjaan)) {
        isCustomJob.value = false;
        selectedJob.value = biodata.pekerjaan ?? selectedJob.value;
      } else {
        isCustomJob.value = true;
        jobController.value.text = biodata.pekerjaan ?? selectedJob.value;
      }
    }
  }

  Future<void> chooseFase() async {
    String? token = await SharedPreferencesHelper.getToken();
    BiodataModel model = BiodataModel(
        id: 0,
        userId: 20,
        nama: nameController.value.text.trim(),
        tempatLahir: placeController.value.text.trim(),
        tanggalLahir: dateController.value.text.trim(),
        alamat: addressController.value.text.trim(),
        usia: int.parse(ageController.value.text.trim()),
        jenisKelamin: selectedGender.value,
        pendidikan: selectedEducation.value,
        pekerjaan:
            isCustomJob.value ? jobController.value.text : selectedJob.value,
        statusTinggal: selectedLive.value,
        fase: selectedPhase.value,
        createdAt: '',
        updatedAt: '');

    await BiodataRepository.instance.updateBiodata(token, model);

    AlarmHelper alarmHelper = AlarmHelper();

    if (selectedPhase == 'Fase Awal') {
      activeFase.value = 1;
      await SharedPreferencesHelper.saveFase(1);
    } else {
      activeFase.value = 2;
      await SharedPreferencesHelper.saveFase(2);
    }

    await alarmHelper.scheduleAlarm();

    Get.back();
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
          DateFormat('yyyy-MM-dd').format(selectedDate); // Format tanggal
    }
  }
}
