import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todomust_app/controllers/persistent/global_controller.dart';
import 'package:todomust_app/controllers/translation_controller.dart';
import 'package:todomust_app/routes/app_Route.dart';
import 'package:todomust_app/services/language_translation.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await GetStorage.init();
  Get.lazyPut(() => GlobalController(), fenix: true);
  await initializeDateFormatting('km', null);
  await initializeDateFormatting('en', null);
  runApp(ToDoMust());
}

class ToDoMust extends StatelessWidget {
  ToDoMust({super.key});
  final globalController = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        title: 'ToDoMust',
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black38,
          fontFamily: globalController.isKhmer.value
              ? 'NotoSansKhmer'
              : 'GoogleSansCode',
        ),

        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: globalController.isKhmer.value
              ? 'NotoSansKhmer'
              : 'GoogleSansCode',
        ),

        themeMode: ThemeMode.system,
        // locale: translationController.isKhmer.value
        //     ? Locale('km', 'KH')
        //     : Locale('en', 'US'),
        fallbackLocale: Locale('en', 'US'),
        translations: LanguageTranslation(),
        getPages: AppRoute.appRoute(),
      ),
    );
  }
}

// For not using GlobalController
/*
  class ToDoMust extends StatelessWidget {
  ToDoMust({super.key});
  final translationController = Get.find<TranslationController>();
  final themeController = Get.find<SwitchThemeService>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        title: 'ToDoMust',
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black38,
          fontFamily: translationController.isKhmer.value
              ? 'NotoSansKhmer'
              : 'GoogleSansCode',
        ),

        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: translationController.isKhmer.value
              ? 'NotoSansKhmer'
              : 'GoogleSansCode',
        ),

        themeMode: ThemeMode.system,
        // locale: translationController.isKhmer.value
        //     ? Locale('km', 'KH')
        //     : Locale('en', 'US'),
        fallbackLocale: Locale('en', 'US'),
        translations: LanguageTranslation(),
        getPages: AppRoute.appRoute(),
      ),
    );
  }
}

 */
