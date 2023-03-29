import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:ongkos/app/data/models/city.dart';
import 'package:ongkos/app/data/services/repository.dart';

class HomeController extends GetxController {
  CityRepository cityRepository;
  HomeController({required this.cityRepository});

  final String title = 'Home Title';
  RxList cities = [].obs;
  RxList filteredCities = [].obs;

  TextEditingController searchController = TextEditingController();

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
      filteredCities.assignAll(cities);
    } catch (error) {
      print("Error fetching cities: $error");
    }
  }

  void filterCities(String query) {
    if (query.isEmpty) {
      filteredCities.assignAll(cities);
    } else {
      filteredCities.assignAll(cities.where((city) =>
          city['city_name'].toLowerCase().contains(query.toLowerCase())));
    }
  }
}
