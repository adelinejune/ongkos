import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:ongkos/app/data/models/city.dart';
import 'package:ongkos/app/data/services/repository.dart';
import 'package:ongkos/app/modules/ongkir%20result/view.dart';

class HomeController extends GetxController {
  CityRepository cityRepository;
  HomeController({required this.cityRepository});

  final String title = 'Home Title';
  RxList cities = [].obs;
  RxList filteredCities = [].obs;

  TextEditingController searchController = TextEditingController();
  TextEditingController beratController = TextEditingController();

  var kotaAsalId = "0".obs;
  var kotaTujuanId = "0".obs;
  var kotaAsal = "".obs;
  var kotaTujuan = "".obs;
  var provinceAsal = "".obs;
  var provinceTujuan = "".obs;

  double berat = 0.0;

  var kurir = [
    {"image": "assets/kurir/jne.png", "code": "jne"},
    {"image": "assets/kurir/jnt.png", "code": "jnt"},
    {"image": "assets/kurir/sicepat.png", "code": "sicepat"},
    {"image": "assets/kurir/pos.png", "code": "pos"},
    {"image": "assets/kurir/lion.png", "code": "lion"},
    {"image": "assets/kurir/anteraja.png", "code": "anteraja"},
    {"image": "assets/kurir/tiki.png", "code": "tiki"},
    {"image": "assets/kurir/ninja.png", "code": "ninja"},
    {"image": "assets/kurir/idexpress.png", "code": "ide"}
  ];

  var selectedKurir = [].obs;

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

  @override
  void onClose() {
    // TODO: implement onClose
    searchController.dispose();
    beratController.dispose();
    selectedKurir.clear();
    super.onClose();
  }

  void filterCities(String query) {
    if (query.isEmpty) {
      filteredCities.assignAll(cities);
    } else {
      filteredCities.assignAll(cities.where((city) =>
          city['city_name'].toLowerCase().contains(query.toLowerCase())));
    }
  }

  void assignKotaAsal(String id, String cityName, String province) {
    kotaAsalId.value = id;
    kotaAsal.value = cityName;
    provinceAsal.value = province;

    filteredCities.assignAll(cities);
  }

  void assignKotaTujuan(String id, String cityName, String province) {
    kotaTujuanId.value = id;
    kotaTujuan.value = cityName;
    provinceTujuan.value = province;
    filteredCities.assignAll(cities);
  }

  void assignBerat(String value) {
    berat = double.tryParse(value)!;
    berat = berat * 1000;

    print(kotaAsal);
    print(kotaTujuan);
    print("$berat gram");
  }

  void checkForm() {
    print(kotaAsalId != 0);
    print(kotaTujuanId != 0);
    print(berat > 0);
    print(selectedKurir.isNotEmpty);
  }

  void ongkosKirim() async {
    Uri url = Uri.parse('https://pro.rajaongkir.com/api/cost');

    if (kotaAsalId != 0 &&
        kotaTujuanId != 0 &&
        berat > 0 &&
        selectedKurir.isNotEmpty) {
      var kurirBody = "";
      if (selectedKurir.length > 1) {
        for (var i = 0; i < selectedKurir.length; i++) {
          if (i == selectedKurir.length - 1) {
            kurirBody += "${selectedKurir[i]}";
          } else {
            kurirBody += "${selectedKurir[i]}:";
          }
        }
      } else {
        kurirBody = selectedKurir[0];
      }

      try {
        final response = await http.post(url, body: {
          "origin": "$kotaAsalId",
          "originType": "city",
          "destination": "$kotaTujuanId",
          "destinationType": "city",
          "weight": "$berat",
          "courier": "$kurirBody",
        }, headers: {
          "key": dotenv.get('API_KEY', fallback: ""),
          "content-type": "application/x-www-form-urlencoded"
        });

        var data = json.decode(response.body) as Map<String, dynamic>;
        var result = data["rajaongkir"]["results"] as List<dynamic>;

        Get.to(() => OngkirResult(result: result));

        print(result);
      } catch (err) {
        print(err);
        Get.defaultDialog(
          title: 'Terjadi kesalahan',
          middleText: err.toString(),
        );
      }
    } else {}
  }
}
