import 'package:web_app/core/const/app_export.dart';
import 'package:web_app/core/const/hintext_method.dart';
import 'package:web_app/core/global_widget/app_text_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: defaultPadding(),
        child: Form(
          key: formKey,
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
                hintext: email(),
                validator: Validator.email,
                title: "Email Address",
                isTitle: true,
              ),
              boxHight20(),
              CustomTextfield(
                controller: controller.passwordController,
                hintext: password(),
                validator: Validator.password,
                title: "Password",
                isTitle: true,
                isPassword: true,
              ),
              boxHight16(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => Container(
                          height: getHeight(24),
                          width: getHeight(24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              getWidth(4, maxWidth: 4),
                            ),
                            color: AppColors.primaryColor,
                          ),
                          child: controller.isRemember.value
                              ? Icon(
                                  Icons.check,
                                  color: AppColors.white,
                                  size: 16,
                                )
                              : null,
                        ),
                      ),
                      boxWidth10(),
                      AppTextButton(
                        text: "Remember Me",
                        onTap: () {
                          controller.toggle();
                        },
                        fontWeight: fontWeight400(),
                        textSize: fontSize16(),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: AppTextButton(
                      text: "Forgot Password?",
                      onTap: () {},
                      fontWeight: fontWeight400(),
                      textSize: fontSize16(),
                    ),
                  ),
                ],
              ),
              boxHight32(),
              CustomSubmitButton(
                text: "Login",
                onTap: () {
                  if (formKey.currentState!.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
