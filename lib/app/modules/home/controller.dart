import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:ongkos/app/data/models/city.dart';
import 'package:ongkos/app/data/services/repository.dart';

class HomeController extends GetxController {
  CityRepository cityRepository;
  HomeController({required this.cityRepository});

  final String title = 'Home Title';
  RxList cities = [].obs;

  var kotaAsalId = 0.obs;
  var kotaTujuanId = 0.obs;
  var kotaAsal = "".obs;
  var kotaTujuan = "".obs;

  var kurir = "".obs;

  double berat = 0.0;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    try {
      final fetchedCities = await cityRepository.fetchCities();
      cities.assignAll(fetchedCities.map((city) => city.toJson()));
      print(cities);
    } catch (error) {
      print("Error fetching cities: $error");
    }
  }
}
