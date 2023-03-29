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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 5.0.wp),
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
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(left: 0),
                                  child: Text(
                                    'Kota Asal',
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 13),
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
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(left: 0),
                                  child: Text(
                                    'Kota Tujuan',
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 13),
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
        ],
      ),
    ));
  }
}
