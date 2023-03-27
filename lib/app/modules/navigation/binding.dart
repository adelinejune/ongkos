import 'package:get/get.dart';
import 'package:ongkos/app/modules/home/controller.dart';
import 'package:ongkos/app/modules/navigation/controller.dart';
import 'package:ongkos/app/modules/resi/controller.dart';
import 'package:ongkos/app/data/services/repository.dart';
import 'package:ongkos/app/data/providers/city/provider.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(
      () => NavigationController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(
          cityRepository: CityRepository(cityProvider: CityProvider())),
    );
    Get.lazyPut<ResiController>(
      () => ResiController(),
    );
  }
}
