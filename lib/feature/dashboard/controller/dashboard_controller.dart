import 'package:web_app/core/const/app_export.dart';

class DashboardController extends GetxController {
  final selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
