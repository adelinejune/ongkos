import 'package:get/get.dart';

class ResiController extends GetxController {
  var counter = 0.obs;

  void increaseCounter() {
    counter++;
  }
}
