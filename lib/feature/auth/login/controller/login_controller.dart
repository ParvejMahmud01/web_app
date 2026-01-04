import 'package:web_app/core/const/app_export.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isRemember = false.obs;

  void toggle() {
    isRemember.value = !isRemember.value;
  }
}
