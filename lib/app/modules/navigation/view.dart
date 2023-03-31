import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ongkos/app/core/utils/extension.dart';
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
            unselectedItemColor: Colors.white,
            unselectedFontSize: 9.0.sp,
            selectedFontSize: 9.0.sp,
            selectedItemColor: Theme.of(context).primaryColorLight,
            currentIndex: controller.tabIndex,
            onTap: controller.changeTabIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2.0.wp, top: 1.5.hp),
                  child: FaIcon(FontAwesomeIcons.boxOpen),
                ),
                label: 'Cek Ongkir',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2.0.wp, top: 1.5.hp),
                  child: FaIcon(FontAwesomeIcons.truck),
                ),
                label: 'Cek Resi',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2.0.wp, top: 1.5.hp),
                  child: FaIcon(FontAwesomeIcons.gear),
                ),
                label: 'Setting',
              ),
            ]),
      );
    });
  }
}
