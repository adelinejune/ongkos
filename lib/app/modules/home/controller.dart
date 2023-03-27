import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:ongkos/app/data/models/city.dart';
import 'package:ongkos/app/data/services/repository.dart';

class HomeController extends GetxController {
  CityRepository cityRepository;
  HomeController({required this.cityRepository});

  final String title = 'Home Title';
  RxList cities = [].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    try {
      await cityRepository.fetchCities();
      var citiesList = cityRepository.cities();
      cities = RxList.from(citiesList.map((item) => item.toJson()));
      print(cities);
    } catch (error) {
      print("Error fetching cities: $error");
    }

    print("done");
  }
}
