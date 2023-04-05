import '../providers/city/provider.dart';
import 'package:ongkos/app/data/models/city.dart';
import 'package:ongkos/app/data/providers/city/provider.dart';

class CityRepository {
  CityProvider cityProvider;
  CityRepository({required this.cityProvider});

  List<City> cities() => cityProvider.cities;
  Future<List<City>> fetchCities() => cityProvider.fetchCities();
}
