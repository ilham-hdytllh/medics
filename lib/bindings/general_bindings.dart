import 'package:get/get.dart';
import 'package:medics/data/repositories/authentication/authentication_repository.dart';
import 'package:medics/data/repositories/events/event_repository.dart';
import 'package:medics/data/repositories/news/news_repository.dart';
import 'package:medics/data/repositories/onboarding/onboarding.dart';
import 'package:medics/presentation/getx/onboarding/onboarding_controller.dart';
import '../core/utils/helpers/network_manager.dart';
import '../data/repositories/flyer/flyer_repository.dart';
import '../presentation/getx/alarm/alarm.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(AuthenticationRepository());
    Get.put(OnboardingRepository());
    Get.put(OnBoardingController());
    Get.put(FlyerRepository());
    Get.put(NewsRepository());
    Get.put(EventRepository());
    Get.put(AlarmController());
  }
}
