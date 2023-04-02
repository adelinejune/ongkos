import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ongkos/app/core/utils/extension.dart';
import 'package:ongkos/app/modules/home/controller.dart';
import 'package:ongkos/app/modules/home/widgets/pilih_kota.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var squareWidth = Get.width - 18.0.wp;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 3.5.wp),
              child: SvgPicture.asset(
                Get.isDarkMode
                    ? 'assets/images/logo_dark.svg'
                    : 'assets/images/logo_light.svg',
                fit: BoxFit.contain,
              ),
            ),

            // Pemilihan Kota Asal dan Tujuan
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 5.0.wp),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(4.5.wp),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Get.isDarkMode
                            ? 'assets/images/home_arrow_dark.svg'
                            : 'assets/images/home_arrow_light.svg',
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Get.to(() => PilihKota(tipe: 'asal'));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(color: Colors.grey),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: Obx(
                                      () => controller.kotaAsal.value.isEmpty
                                          ? Text(
                                              'Kota Asal',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 14),
                                            )
                                          : Text(
                                              controller.kotaAsal.value,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.to(() => PilihKota(tipe: 'tujuan'));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(color: Colors.grey),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: Obx(
                                      () => controller.kotaTujuan.value.isEmpty
                                          ? Text(
                                              'Kota Tujuan',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 14),
                                            )
                                          : Text(
                                              controller.kotaTujuan.value,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Pemilihan Berat
            Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 2.0.wp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Berat Paket',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Container(
                      height: 40,
                      child: TextField(
                        autocorrect: false,
                        autofocus: false,
                        controller: controller.beratController,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w500,
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10.0,
                          ),
                          suffixIcon: Container(
                            width: 30,
                            child: const Center(
                              child: Text(
                                'kg',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Work Sans',
                                    fontSize: 15),
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: (value) => controller.assignBerat(value),
                      ),
                    )
                  ],
                )),

            //Pemilihan Kurir
            Padding(
              padding: EdgeInsets.only(
                  left: 5.0.wp, right: 5.0.wp, top: 4.0.wp, bottom: 4.0.wp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pilih Kurir',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Wrap(
                    spacing: 4.0.wp,
                    children: controller.kurir
                        .map((e) => Obx(() {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 3.5),
                                child: SizedBox(
                                  width: squareWidth / 3,
                                  child: ChoiceChip(
                                    label: Container(
                                      width: squareWidth / 3,
                                      height: 30,
                                      padding: EdgeInsets.all(3.5),
                                      child: SizedBox(
                                        child: Image(
                                          image: AssetImage(e['image']!),
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                    selected: controller.selectedKurir
                                        .contains(e['code']),
                                    backgroundColor: Colors.white,
                                    selectedColor: Colors.grey.shade300,
                                    pressElevation: 0,
                                    onSelected: (selected) {
                                      if (selected) {
                                        controller.selectedKurir.add(e['code']);
                                      } else {
                                        controller.selectedKurir
                                            .remove(e['code']);
                                      }
                                      print(controller.selectedKurir);
                                    },
                                    shape: ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.5),
                                    ),
                                    //
                                  ),
                                ),
                              );
                            }))
                        .toList(),
                  )
                ],
              ),
            ),

            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 4.0.wp),
              child: SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    controller.ongkosKirim();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Kalkulasi Ongkir',
                        style: TextStyle(
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 19.0,
                          letterSpacing: 0.8,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          'assets/images/box.png',
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
