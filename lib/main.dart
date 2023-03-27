import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ongkos/app/core/theme/theme_service.dart';
import 'package:ongkos/app/core/theme/themes.dart';
import 'package:ongkos/app/routes/app_pages.dart';
import 'package:ongkos/app/routes/app_routes.dart';

void main() async {
  await dotenv.load(fileName: '.env');

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.NAVIGATION,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      title: 'Ongkos Kirim',
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemeService().getThemeMode(),
    );
  }
}
