import 'package:get/get.dart';
import 'package:ongkos/app/modules/navigation/binding.dart';
import 'package:ongkos/app/modules/navigation/view.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.NAVIGATION,
      page: () => const NavigationPage(),
      binding: NavigationBinding(),
    )
  ];
}
