import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ongkos/app/modules/home/view.dart';
import 'package:ongkos/app/modules/resi/view.dart';
import 'package:ongkos/app/modules/setting/view.dart';

import './controller.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
            child: IndexedStack(
          index: controller.tabIndex,
          children: [HomePage(), CekResiPage(), SettingPage()],
        )),
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.redAccent,
            currentIndex: controller.tabIndex,
            onTap: controller.changeTabIndex,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.boxOpen),
                label: 'Cek Ongkir',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.truck),
                label: 'Cek Resi',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.gear),
                label: 'Setting',
              ),
            ]),
      );
    });
  }
}
