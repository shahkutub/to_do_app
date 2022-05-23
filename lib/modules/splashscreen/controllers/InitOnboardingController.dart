import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:listtodo_get/routes/app_pages.dart';


class InitOnboardingController extends GetxController{
  PageController pageController = PageController();
  int _index = 0;
  int get index => _index;



  onPageChanged(int value) {
    _index = value;
    print("_index "+_index.toString());
    update();
  }

  @override
  Future<void> onInit()  async {
    // TODO: implement onInit
    super.onInit();
    await GetStorage.init();
    print(GetStorage().read("onboard"));
    if(GetStorage().read("onboard") == "true"){
      Get.offAllNamed(Routes.HOME);
    }
  }

}