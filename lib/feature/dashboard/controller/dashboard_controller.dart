import 'package:web_app/core/const/app_export.dart';

class DashboardController extends GetxController {
  final selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  Future<void> logout() async {
    // Keep Remember Me data only if user checked it
    bool keepRemembered = await SharePref.getRememberMe();
    await SharePref.clearAll(keepRemembered: keepRemembered);

    Get.offAllNamed(AppRoutes.login);
  }
}
