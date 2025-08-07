import 'package:get/get.dart';
import 'package:todomust_app/services/switch_theme.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SwitchThemeService(), fenix: true);
  }
}
