import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ongkos/app/core/utils/extension.dart';
import 'package:ongkos/app/modules/home/controller.dart';

class OngkirResult extends StatelessWidget {
  var result;

  OngkirResult({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.find<HomeController>();

    return Scaffold(
      body: SafeArea(
        child: ListView(
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
                        'Biaya Pengiriman',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DestinationInfo(homeCtrl: homeCtrl),
            Column(
              children: List.generate(
                result.length,
                (index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.0.wp + 20),
                        child: Row(
                          children: [
                            Text(
                              '${result[index]["code"].toUpperCase()}',
                              style: TextStyle(
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 0.5),
                            ),
                            Text(
                              '- ${result[index]['name']}',
                              style: TextStyle(
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.5),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DestinationInfo extends StatelessWidget {
  const DestinationInfo({
    super.key,
    required this.homeCtrl,
  });

  final HomeController homeCtrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 2.0.wp + 20, vertical: 4.0.wp),
        child: Row(
          children: [
            SvgPicture.asset('assets/images/result_arrow.svg'),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              homeCtrl.kotaAsal.value,
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Work Sans',
                              ),
                            ),
                            Text(
                              homeCtrl.provinceAsal.value,
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontFamily: 'Work Sans',
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              homeCtrl.kotaTujuan.value,
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Work Sans',
                              ),
                            ),
                            Text(
                              homeCtrl.provinceTujuan.value,
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontFamily: 'Work Sans',
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(children: [
                    Text(
                      '${homeCtrl.berat.round()}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      'grams',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Work Sans',
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
