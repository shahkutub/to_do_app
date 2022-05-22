import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  final _size = Get.size;

  @override
  Widget build(BuildContext context) {
    Get.find<SplashscreenController>();
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Splash screen',style:TextStyle(color: Colors.white,fontSize: 15) ),
        ],
      ),
    );
  }
}
