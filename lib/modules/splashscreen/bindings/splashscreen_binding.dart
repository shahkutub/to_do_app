import 'package:get/get.dart';
import 'package:listtodo_get/modules/splashscreen/controllers/InitOnboardingController.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<SplashscreenController>(
    //   () => SplashscreenController(),
    // );
    Get.lazyPut<InitOnboardingController>(
      () => InitOnboardingController(),
    );
  }
}
