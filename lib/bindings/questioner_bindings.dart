import 'package:get/get.dart';
import 'package:medics/presentation/getx/questioner/questioner_controller.dart';

class QuestionerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(QuestionerFirstController());
  }
}
