import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ongkos/app/modules/setting/controller.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Setting")),
    );
  }
}
