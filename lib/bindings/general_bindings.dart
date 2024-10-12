import 'package:get/get.dart';
import 'package:medics/data/repositories/authentication/authentication_repository.dart';
import '../core/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(AuthenticationRepository());
  }
}
