

import 'package:get/get.dart';
import 'package:listtodo_get/modules/detailse/controllers/details_controller.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(
          () => DetailsController(),
    );
  }
}