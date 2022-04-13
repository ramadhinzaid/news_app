import 'package:get/get.dart';
import 'package:news_app/pages/detail_page.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/pages/splash_screen.dart';
import 'package:news_app/routes/route_name.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: RouteName.splashScreen, page: () => const SplashScreen()),
    GetPage(name: RouteName.homePage, page: () => HomePage()),
    GetPage(name: RouteName.detailPage, page: () => DetailPage())
  ];
}
