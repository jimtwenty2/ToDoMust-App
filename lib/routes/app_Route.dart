import 'package:get/route_manager.dart';
import 'package:todomust_app/bindings/home_binding.dart';
import 'package:todomust_app/bindings/profile_binding.dart';
import 'package:todomust_app/bindings/setting_binding.dart';
import 'package:todomust_app/bindings/todo_binding.dart';
import 'package:todomust_app/bindings/translation_binding.dart';
import 'package:todomust_app/routes/named_Route.dart';
import 'package:todomust_app/views/main_view.dart';
import 'package:todomust_app/views/start_view.dart';
import 'package:todomust_app/views/todo_view.dart';

import '../bindings/bottomnavbar_binding.dart';

class AppRoute {
  // STATIC METHOD that contains a list of all route in the app
  static appRoute() => [
    GetPage(
      name: NamedRoute.STARTVIEW,
      page: () => StartView(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: NamedRoute.MAINVIEW,
      page: () => MainView(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
      bindings: [
        BottomNavBarBinding(),
        HomeBinding(),
        SettingBinding(),
        ProfileBinding(),
        TranslationBinding(),
      ],
    ),
    GetPage(
      name: NamedRoute.TODOVIEW,
      page: () => TodoView(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
      binding: TodoBinding(),
    ),
  ];
}
