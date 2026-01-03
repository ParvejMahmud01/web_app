import 'package:web_app/core/const/app_export.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: defaultPadding(),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Welcome",
                fontSize: fontSize32(),
                fontWeight: fontWeight700(),
              ),
              boxHight4(),
              CustomText(
                text: "Please login here",
                fontSize: fontSize16(),
                fontWeight: fontWeight400(),
                color: AppColors.textGrey,
              ),
              boxHight32(),
              CustomTextfield(
                controller: controller.emailController,
                hintext: "email",
                validator: Validator.email,
              ),
              boxHight32(),
              CustomSubmitButton(
                text: "Login",
                onTap: () {
                  if (_formKey.currentState!.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
