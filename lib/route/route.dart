import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:semper/screen/detail/detail_Screen.dart';
import 'package:semper/screen/page/page_screen.dart';
import 'package:semper/screen/splash/splash_screen.dart';

class Routes {
  static List<GetPage<dynamic>> get() {
    return [
      GetPage(name: '/', page: () => const SplashScreen()),
      GetPage(name: '/page', page: () => const PageScreen()),
      GetPage(name: '/detail', page: () => const DetailScreen()),
    ];
  }
}
