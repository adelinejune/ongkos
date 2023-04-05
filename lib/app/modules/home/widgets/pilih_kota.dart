import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:ongkos/app/core/utils/extension.dart';
import 'package:ongkos/app/modules/home/controller.dart';

class PilihKota extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  PilihKota({super.key, required this.tipe});

  final String tipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 40),
                      child: Text(
                        tipe == 'asal'
                            ? 'Asal Pengiriman'
                            : 'Tujuan Pengiriman',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 4.0.wp,
                right: 4.0.wp,
                top: 5.0,
                bottom: 10.0,
              ),
              child: Container(
                height: 41,
                child: TextField(
                  controller: homeCtrl.searchController,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Work Sans',
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Cari Lokasi',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Work Sans',
                    ),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.5,
                      horizontal: 20.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    homeCtrl.filterCities(value);
                  },
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => homeCtrl.cities.isEmpty
                    ? Padding(
                        padding: EdgeInsets.only(bottom: 8.0.wp),
                        child: SpinKitFoldingCube(
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    : ListView.builder(
                        itemCount: homeCtrl.filteredCities.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Text(
                                  '${homeCtrl.filteredCities[index]['type']} ${homeCtrl.filteredCities[index]['city_name']}',
                                  style: TextStyle(
                                      fontFamily: 'Work Sans',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.5.sp),
                                ),
                                subtitle: Text(
                                  homeCtrl.filteredCities[index]['province'],
                                  style: TextStyle(
                                    fontFamily: 'Work Sans',
                                    color: Colors.grey[500],
                                    fontSize: 10.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                onTap: () {
                                  final cityId =
                                      homeCtrl.filteredCities[index]['city_id'];
                                  final cityName =
                                      '${homeCtrl.filteredCities[index]['type']} ${homeCtrl.filteredCities[index]['city_name']}';
                                  final province = homeCtrl
                                      .filteredCities[index]['province'];

                                  tipe == 'asal'
                                      ? homeCtrl.assignKotaAsal(
                                          cityId, cityName, province)
                                      : homeCtrl.assignKotaTujuan(
                                          cityId, cityName, province);
                                  homeCtrl.searchController.clear();
                                  Get.back();
                                },
                              ),
                              Divider(height: 1, thickness: 1)
                            ],
                          );
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
