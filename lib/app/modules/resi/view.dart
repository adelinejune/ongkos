import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ongkos/app/modules/resi/controller.dart';

class CekResiPage extends GetView<ResiController> {
  const CekResiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Obx(() => Text("Counter ${controller.counter}")),
        ElevatedButton(
            onPressed: () {
              controller.increaseCounter();
            },
            child: Text('Increase'))
      ]),
    );
  }
}
