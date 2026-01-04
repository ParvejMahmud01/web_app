import 'package:web_app/core/const/app_export.dart';
import 'package:web_app/core/const/sharepref.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isRemember = false.obs;
  final isLoading = false.obs;

  void toggle() {
    isRemember.value = !isRemember.value;
  }

  @override
  void onInit() {
    super.onInit();
    _loadRememberedUser();
  }

  Future<void> _loadRememberedUser() async {
    final email = await SharePref.getSavedEmail();
    final password = await SharePref.getSavedPassword();
    final rememberMe = await SharePref.getRememberMe();

    // Delay to let the UI render first
    Future.delayed(Duration.zero, () {
      if (email != null && password != null && rememberMe) {
        emailController.text = email;
        passwordController.text = password;
        isRemember.value = true;
      } else {
        emailController.clear();
        passwordController.clear();
        isRemember.value = false;
      }
    });
  }

  Future<void> login() async {
    isLoading.value = true;

    try {
      await Future.delayed(const Duration(seconds: 1));

      // Mock login success
      const fakeToken = "token_123456";
      const fakeUserId = "user_001";

      await SharePref.saveToken(fakeToken);
      await SharePref.saveUserId(fakeUserId);

      // Save Remember Me state
      await SharePref.saveRememberMe(isRemember.value);

      if (isRemember.value) {
        await SharePref.saveEmail(emailController.text);
        await SharePref.savePassword(passwordController.text);
      } else {
        await SharePref.saveEmail('');
        await SharePref.savePassword('');
      }

      Get.offAllNamed(AppRoutes.dashboard);
    } finally {
      isLoading.value = false;
    }
  }
}
