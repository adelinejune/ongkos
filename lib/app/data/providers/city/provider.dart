import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:ongkos/app/data/models/city.dart';
import 'package:http/http.dart' as http;

class CityProvider {
  List<City> _cities = [];

  List<City> get cities => _cities;

  Future<List<City>> fetchCities() async {
    // Add code to fetch cities from the API and update the _cities list
    // For example:
    Uri url = Uri.parse('https://api.rajaongkir.com/starter/city');

    try {
      final response = await http.get(url,
          headers: {"key": dotenv.get('API_KEY', fallback: "") as String});

      var data = json.decode(response.body) as Map<String, dynamic>;

      var statusCode = data["rajaongkir"]["status"]["code"];

      if (statusCode != 200) throw data["rajaongkir"]["status"]["description"];

      var listAllCity = data["rajaongkir"]["results"] as List<dynamic>;

      _cities = City.fromJsonList(listAllCity);

      return _cities;
    } catch (error) {
      print(error);
      return List<City>.empty();
    }
  }
}
