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
                        itemCount: homeCtrl.cities.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(homeCtrl.cities[index]['city_name']),
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
