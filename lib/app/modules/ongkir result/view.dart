import 'package:flutter/material.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:intl/intl.dart';
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
    final formatter =
        NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);

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
                      homeCtrl.clear();
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

            // Result
            Column(
              children: List.generate(
                result.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 18.0, bottom: 15.0),
                          child: Row(
                            children: [
                              Text(
                                '${result[index]["code"].toUpperCase()}',
                                style: TextStyle(
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.5,
                                    letterSpacing: 0.5,
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              Text(
                                ' - ${result[index]['name']}',
                                style: TextStyle(
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: List.generate(
                            result[index]['costs'].length,
                            (costIndex) {
                              var cost = result[index]['costs'][costIndex];
                              return Container(
                                decoration: BoxDecoration(
                                  color: Get.isDarkMode
                                      ? Theme.of(context).primaryColorDark
                                      : Colors.white,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Get.isDarkMode
                                          ? Colors.grey[900]!
                                          : Colors.grey.shade300,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: ListTile(
                                  title: Text(
                                    cost['service'],
                                    style: const TextStyle(
                                      fontFamily: 'Work Sans',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  subtitle: Text(
                                    cost['description'],
                                    style: TextStyle(
                                      fontFamily: 'Work Sans',
                                      fontSize: 12,
                                      color: Get.isDarkMode
                                          ? Color.fromRGBO(255, 255, 255, 0.8)
                                          : Color.fromRGBO(0, 0, 0, 0.8),
                                    ),
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        formatter
                                            .format(cost['cost'][0]['value']),
                                        // cost['cost'][0]['value'].toString(),
                                        style: TextStyle(
                                          fontFamily: 'Work Sans',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Get.isDarkMode
                                              ? Theme.of(context)
                                                  .primaryColorLight
                                              : Theme.of(context).primaryColor,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      Text(
                                        '${cost['cost'][0]['etd'].toString()} days',
                                        style: TextStyle(
                                          fontFamily: 'Work Sans',
                                          fontSize: 12.5,
                                          color: Get.isDarkMode
                                              ? Color.fromRGBO(
                                                  255, 255, 255, 0.8)
                                              : Color.fromRGBO(0, 0, 0, 0.8),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 70,
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ElevatedButton(
          onPressed: () {
            // Do something when the button is pressed
            homeCtrl.clear();
            Get.back();
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            minimumSize: MaterialStateProperty.all(Size.fromHeight(48.0)),
            backgroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).primaryColor,
            ),
          ),
          child: const Text(
            'Back',
            style: TextStyle(
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w500,
                fontSize: 20),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
