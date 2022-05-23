import 'package:get/get.dart';
import 'package:listtodo_get/modules/detailse/bindings/details_binding.dart';
import 'package:listtodo_get/modules/detailse/views/details_page.dart';
import 'package:listtodo_get/modules/home/bindings/home_binding.dart';
import 'package:listtodo_get/modules/home/views/home_page.dart';
import 'package:listtodo_get/modules/search/bindings/search_binding.dart';
import 'package:listtodo_get/modules/search/views/search_page.dart';

import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';



part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [

    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchPage(),
      binding: SearchBinding(),
    ),

    GetPage(
      name: _Paths.DETAILS,
      page: () => DetailsPage(),
      binding: DetailsBinding(),
    ),

  ];
}
