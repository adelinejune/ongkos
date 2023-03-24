import 'package:get/get.dart';
import 'package:ongkos/app/modules/home/controller.dart';
import 'package:ongkos/app/modules/navigation/controller.dart';
import 'package:ongkos/app/modules/resi/controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(
      () => NavigationController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ResiController>(
      () => ResiController(),
    );
  }
}
