import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ongkos/app/core/theme/theme_service.dart';
import 'package:ongkos/app/core/utils/extension.dart';
import 'package:day_night_switch/day_night_switch.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = ThemeService().isSavedDarkMode();
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
              padding:
                  EdgeInsets.symmetric(horizontal: 6.0.wp, vertical: 8.0.wp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ganti Tema',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    width: 13.0.wp,
                    child: FittedBox(
                      child: DayNightSwitch(
                        value: isDarkMode,
                        onChanged: (value) {
                          setState(() {
                            isDarkMode = value;
                          });
                          ThemeService().changeThemeMode();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
